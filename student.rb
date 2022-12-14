require_relative 'persons'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(name, age, classroom, _parent_permission)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'classroom' => @classroom,
      'parent_permission' => @parent_permission
    }
  end
end
