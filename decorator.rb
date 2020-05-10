class PersonInterface
  def last_name
  end
end

class Person < PersonInterface
  def initialize(last_name)
    @last_name = last_name
  end

  def last_name
    @last_name
  end
end

class DecoratorInterface
  def last_name; end
end

class MenDecorator < DecoratorInterface
  def initialize(men)
    @men = men
  end

  def last_name
    "Mr. #{@men.last_name}"
  end
end

class NotMerriedWomenDecorator < DecoratorInterface
  def initialize(women)
    @women = women
  end

  def last_name
    "Ms. #{@women.last_name}"
  end
end

class MerriedWomenDecorator < DecoratorInterface
  def initialize(women)
    @women = women
  end

  def last_name
    "Mrs. #{@women.last_name}"
  end
end

women = Person.new('Ivanova')
not_merried_women = NotMerriedWomenDecorator.new(women)
merried_women = MerriedWomenDecorator.new(women)

men = Person.new('Ivanov')
merried_men = MenDecorator.new(men)

puts "Women's last name:"
puts women.last_name
puts '----------------------------------'

puts "Not merried women's last name:"
puts not_merried_women.last_name
puts '----------------------------------'

puts "Merried women's last name:"
puts merried_women.last_name
puts '----------------------------------'

puts "Men's last name:"
puts men.last_name
puts '----------------------------------'

puts "Merried men's last name:"
puts merried_men.last_name
puts '----------------------------------'
