class Demon
  def initialize(type)
    @type = type
  end

  def spawn(cord_x, cord_y)
    puts "Spawming demon of type #{@type.name} in cords [#{cord_x};#{cord_y}]"
  end
end
