The Pokemon interactive battle game.

Still in development.  Example use cases:

from command line using interactive ruby:

$ irb
\> load "PokeTeam.rb"
\> dex = PokeDex.new
\> david = PokeTeam.new("David", [3,6,9,149,145,150], dex)
\> gary = PokeTeam.random\_team("Gary", dex, 150)
\> david.challenge(gary)

to test randomness of the battle winner:

\> david.test\_randomness(gary, 10000)
