
require "./PokeDex.rb"
require "./PokeBattle.rb"

# This is the "Party" that belongs to a trainer.
# A PokeTeam can challenge other PokeTeams via the
# #challenge method, which uses the PokeBattle construct.
class PokeTeam

  attr_reader :trainer
  attr_reader :pokemon
  attr_reader :base_stat_total.to_s
  attr_reader :types
  attr_reader :weaknesses

  def initialize trainer, number_array, pokedex
    @trainer = trainer
    @pokemon = Array.new(6)
    @types = {
      "normal" => 0,   "fire" => 0,     "water" => 0,    "electric" => 0,
      "grass" => 0,    "ice" => 0,      "fight" => 0,    "poison" => 0, 
      "ground" => 0,   "flying" => 0,   "psychic" => 0,  "bug" => 0,
      "rock" => 0,     "ghost" => 0,    "dragon" => 0,   "dark" => 0, 
      "steel" => 0
    }
    @weaknesses = {
      "normal" => 0,   "fire" => 0,     "water" => 0,    "electric" => 0,
      "grass" => 0,    "ice" => 0,      "fight" => 0,    "poison" => 0, 
      "ground" => 0,   "flying" => 0,   "psychic" => 0,  "bug" => 0,
      "rock" => 0,     "ghost" => 0,    "dragon" => 0,   "dark" => 0, 
      "steel" => 0
    }
    @base_stat_total = 0

    number_array.each_with_index do |id, index|
      @pokemon[index] = pokedex.get_pokemon(id)
    end

    @pokemon.each do |poke|
      @base_stat_total += poke.base_total_stats
      poke.weaknesses.each do |type, magnitude|
        @weaknesses[type] += Float(magnitude)
      end
      poke.types.each do |type|
        @types[type.downcase] += 1/Float(poke.types.length) * poke.base_total_stats
      end
    end
  end

  def get_pokemon number
    @pokemon[number]
  end

  def challenge vs_team, text_mode=true

    battle = PokeBattle.new(self, vs_team)

    battle.execute text_mode
  end

  def test_randomness vs_team, num_battles

    t0 = 0
    t1 = 0


    num_battles.times do |i|
      if ( self.challenge(vs_team, false) == 1 )
        t0 += 1
      else
        t1 += 1
      end  
    end

    puts self.trainer + ": " + t0.to_s
    puts vs_team.trainer + ": " + t1.to_s
  end

  def self.random_team trainer, pokedex, range=151

    team = Array.new(6)

    6.times do |i|
      team[i] = rand(range)
    end

    return PokeTeam.new(trainer, team, pokedex)
  end

end
