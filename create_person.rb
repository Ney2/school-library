require './classroom'
require './persons'
require './teacher'
require './student'

class PersonModule
  attr_accessor :persons, :students, :teachers

  def initialize(persons, students, teachers)
    @persons = persons
    @students = students
    @teachers = teachers
  end

  def list_people
    if @persons.empty?
      puts 'No person available'
      return
    end
    @persons.each_with_index do |person, index|
      puts "#{index + 1} - [#{person.class}] #{person.id} #{person.age} #{person.name}"
    end
    puts '-----------------------------'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [input the number]'
    input = gets.chomp
    case input.to_i
    when 1
      student_option
    when 2
      teacher_option
    else
      puts 'you entered invalid input! Please try again:'
      return
    end
    puts 'Person selected succesfully'
    puts '-----------------------------'
  end

  def permission?(parent_permission)
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    case permission
    when 'n', 'N'
      !parent_permission
    when 'y', 'Y'
      parent_permission
    else
      permission?(parent_permission)
    end
  end

  def create_student(classroom, age, name, parent_permission)
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @persons << student unless @persons.include?(student)
    @students << student unless @students.include?(student)
  end

  def create_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @persons << teacher unless @persons.include?(teacher)
    @teachers << teacher unless @teachers.include?(teacher)
  end

  def student_option
    print ' Enter student Name : '
    name = gets.chomp
    print ' Enter student Age : '
    age = gets.chomp
    print ' Enter student Classroom <number> : '
    classroom = gets.chomp
    parent_permission = true
    permission?(parent_permission)
    create_student(classroom.to_i, age.to_i, name, parent_permission)
    puts "New student #{name} has been Added successfully! \n
  #{name} is #{age} years old is in classroom #{classroom.to_i}"
    puts '-----------------------------'
  end

  def teacher_option
    print 'Enter teacher name:'
    name = gets.chomp
    print 'Enter teacher age:'
    age = gets.chomp
    print 'Enter teacher specialization:'
    specialization = gets.chomp
    create_teacher(specialization, age.to_i, name)
    puts '-----New Teacher Added Successfully----'
    puts "#{name} is #{age} years old, specialization is #{specialization}"
    puts '-----------------------------'
  end
end
