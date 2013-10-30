


class PokeBattle

  def initialize team0, team1
    @team_0 = team0
    @team_1 = team1
    # Battle Rating - Higher is Better
    @team_0_battle_rating = 0
    @team_1_battle_rating = 0
  end

  def execute text_mode
    calculate_ratings

    result = find_winner

    if ( text_mode)
      battle_text result
    end

    return result
  end

  def find_winner
    t0 = @team_0_battle_rating
    t1 = @team_1_battle_rating
    delta = t0 - t1
    total = t0 + t1

    weighted_delta = delta * 1

    result = rand(total)
    if ( result <= total/2.0 + weighted_delta )
      return 1
    else
      return -1
    end
  end

  def battle_text result

    puts "-~~!! #{@team_0.trainer} vs. #{@team_1.trainer} !!~~-"
    puts "#{@team_0.trainer}: " + format_team_names(@team_0)
    puts "#{@team_1.trainer}: " + format_team_names(@team_1)

    puts @team_0.trainer + " Battle Rating: " + @team_0_battle_rating.to_s
    puts @team_1.trainer + " Battle Rating: " + @team_1_battle_rating.to_s

    if ( result == 1 )
      puts "#{@team_0.trainer} wins!"
      return 1
    else
      puts "#{@team_1.trainer} wins!"
      return -1
    end
  end

  def format_team_names team
    team_str = ""
    team.pokemon.each_with_index do |poke, index|
      if (index == team.pokemon.length - 1)
        team_str += poke.name
      else
        team_str += poke.name + ", "
      end
    end

    return team_str
  end

  def calculate_ratings

    @team_0.weaknesses.each do |def_type, def_mag|
      @team_1.types.each do |atk_type, atk_mag|
        if ( atk_type == def_type )
          @team_1_battle_rating += def_mag * atk_mag
        end
      end
    end
    @team_1.weaknesses.each do |def_type, def_mag|
      @team_0.types.each do |atk_type, atk_mag|
        if ( atk_type == def_type )
          @team_0_battle_rating += def_mag * atk_mag
        end
      end
    end


  end

end
