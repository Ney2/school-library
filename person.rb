require './nameable'
require './capitalize'
require './trimmer'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_servicies?
    of_age? || @parent_permission
  end

  def correct_name
    @name
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

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalize)
puts capitalizedTrimmedPerson.correct_name
