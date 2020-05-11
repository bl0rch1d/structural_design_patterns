class DoomGame
  def initialize
    @demon_factory = DemonFactory.new
  end

  def init_level
    @level = Level.new
  end

  def create_demon(name, model_object, textures, animations)
    @level.demons << @demon_factory.call(name, model_object, textures, animations)
  end

  def spawn_demons(cords)
    demons_available = @level.demons.count

    cords.each do |cord_x, cord_y|
      demon_index = rand(demons_available - 1)

      sleep 0.5
      
      @level.spawn_demon(cord_x, cord_y, @level.demons[demon_index])
    end
  end

  def show_demon_types
    @demon_factory.demon_types.map(&:name).join(', ')
  end

  def show_demons
    @level.demons
  end
end
