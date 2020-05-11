require_relative 'autoload'

# Resource files stubs
model_object = 'path_to_model_object'
textures = 'path_to_textures'
animations = 'path_to_animations'

game = DoomGame.new

game.init_level
game.create_demon('Cacodemon', model_object, textures, animations)
game.create_demon('Baron of Hell', model_object, textures, animations)
game.create_demon('Cacodemon', model_object, textures, animations)
game.create_demon('Cherub', model_object, textures, animations)
game.create_demon('Cherub', model_object, textures, animations)
game.create_demon('Cacodemon', model_object, textures, animations)
game.create_demon('Mancubus', model_object, textures, animations)
game.create_demon('Cherub', model_object, textures, animations)
game.create_demon('Mancubus', model_object, textures, animations)
game.create_demon('Hell Knight', model_object, textures, animations)

puts 'Demon types:'
puts game.show_demon_types
puts "\n"

puts 'Demons:'
puts game.show_demons
puts "\n"

cords = [[1, 2], [45, 4], [30, 5], [6, 3], [0, 2], [98, 98]]
puts 'Spawning demons...'
game.spawn_demons(cords)
