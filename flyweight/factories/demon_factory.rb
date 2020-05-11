class DemonFactory
  attr_reader :demon_types

  def initialize
    @demon_types = []
  end
  
  def call(name, model_object, textures, animations)
    existed_type = find_type(name)

    return create_demon(existed_type) if existed_type

    new_demon_type = create_demon_type(name, model_object, textures, animations)

    create_demon(new_demon_type)
  end

  private

  def find_type(name)
    @demon_types.find { |type| type.name == name }
  end

  def create_demon(type)
    Demon.new(type)
  end

  def create_demon_type(name, model_object, textures, animations)
    type = DemonType.new(name, model_object, textures, animations)

    @demon_types << type

    type
  end
end
