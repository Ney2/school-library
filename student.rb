require './person'

class Student < Person
  def initalalize(age, classroom, parent_permission: true, name: 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
