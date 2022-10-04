require './person'

class Teacher < Person
  def initalalize(age, specialization, parent_permission: true, name: 'Unknown')
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_servicies?
    true
  end
end
