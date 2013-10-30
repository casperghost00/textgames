
class Pokemon

  attr_reader :name
  attr_reader :types
  attr_reader :weaknesses
  attr_reader :base_total_stats

  def initialize poke_json
    @name = poke_json["name"]
    @types = poke_json["type"]
    @weaknesses = poke_json["damages"]
    @base_total_stats = 0

    poke_json["stats"].each do |stat, value|
      @base_total_stats += Integer(value)
    end
  end

end

