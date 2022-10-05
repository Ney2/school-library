require './nameable'
require './capitalize'
require './trimmer'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  def can_use_servicies?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
  
  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(18, 'maximilianus')
puts person.correct_name

capitalize = CapitalizeDecorator.new(person)
puts capitalize.correct_name

trimmed = TrimmerDecorator.new(capitalize)
puts trimmed.correct_name
