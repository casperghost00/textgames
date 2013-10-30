
require 'json'
require './Pokemon.rb'

# This class is responsible for loading in
# all of the Pokemon data from a json file and
# making it available for other classes.
class PokeDex

  def initialize
    @pokedex_json = JSON.parse(IO.read("pokedex.json"))
  end

  def get_pokemon number
    Pokemon.new(@pokedex_json[number-1])
  end

end
