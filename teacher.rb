require './persons'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name = 'Unknown', specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization
    }
  end

end
