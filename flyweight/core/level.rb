class Level
  attr_reader :demons

  def initialize
    @demons = []
  end

  def spawn_demon(cord_x, cord_y, demon)
    demon.spawn(cord_x, cord_y)
  end
end
