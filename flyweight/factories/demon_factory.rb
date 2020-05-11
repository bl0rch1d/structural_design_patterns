class DemonFactory
  attr_reader :demon_types

  def initialize
    @demon_types = []
  end
  
  def call(name, model_object, textures, animations)
    existed_type = @demon_types.find { |type| type.name == name }

    return Demon.new(existed_type) if existed_type

    new_demon_type = DemonType.new(name, model_object, textures, animations)
    @demon_types << new_demon_type

    Demon.new(new_demon_type)
  end
end
