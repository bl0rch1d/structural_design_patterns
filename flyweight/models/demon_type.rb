class DemonType
  attr_reader :name, :model_object, :textures, :animations

  def initialize(name, model_object, textures, animations)
    @name = name
    @model_object = model_object
    @textures = textures
    @animations = animations
  end
end
