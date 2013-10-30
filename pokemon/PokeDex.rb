
require 'json'
require './Pokemon.rb'

class PokeDex

  def initialize
    @pokedex_json = JSON.parse(IO.read("pokedex.json"))
  end

  def get_pokemon number
    Pokemon.new(@pokedex_json[number-1])
  end

end
