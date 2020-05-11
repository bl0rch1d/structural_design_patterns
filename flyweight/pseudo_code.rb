# Prototypes
class Demon; end
class DemonType; end
class DemonFactory; end

class Level; end
class DoomGame; end
# ===================

class DemonType
  attr_reader :name, :model_object, :textures, :animations

  def initialize(name, model_object, textures, animations)
    @name = name
    @model_object = model_object
    @textures = textures
    @animations = animations
  end
end

class Demon
  def initialize(type)
    @type = type
  end

  def spawn(cord_x, cord_y); end
end

class DemonFactory
  attr_reader :demon_types

  def initialize
    @demon_types = []
  end
  
  def call(name, model_object, textures, animations); end
end

class Level
  attr_reader :demons

  def initialize
    @demons = []
  end

  def spawn_demon(cord_x, cord_y, demon); end
end

class DoomGame
  def initialize
    @demon_factory = DemonFactory.new
  end

  def init_level
    @level = Level.new
  end

  def create_demon(name, model_object, textures, animations); end

  def spawn_demons(cords); end

  def show_demon_types; end

  def show_demons; end
end

game = DoomGame.new

game.init_level

game.create_demon('Cacodemon', model_object, textures, animations)
game.create_demon('Baron of Hell', model_object, textures, animations)
game.create_demon('Cacodemon', model_object, textures, animations)

game.spawn_demons(cords)
