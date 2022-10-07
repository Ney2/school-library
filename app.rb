require './person'
require './teacher'
require './student'
require './books'
require './rental'
require 'date'
require './classroom'

class Apps
  attr_accessor :books, :people

  def initialize
    @rentals = []
    @people = []
    @books = []
    @teachers = []
    @students = []
  end

  def list_books
    if @books.empty?
      puts 'No available books'
      return
    end
    @books.each_with_index do |book, index|
      puts " #{index + 1} - Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts '-----------------------------'
  end

  def list_people
    if @people.empty?
      puts 'No person available'
      return
    end
    @people.each_with_index do |person, index|
      puts "#{index + 1} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
    @people << student unless @people.include?(student)
    @students << student unless @students.include?(student)
  end

  def create_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher unless @people.include?(teacher)
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

  def create_new_book
    print ' Enter Book Title : '
    title = gets.chomp
    print ' Enter Book Author : '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    puts "#{title} by #{author} added to book list successfuly!\n"
    puts '-----------------------------'
  end

  def create_rental
    puts ' Select a Book from the list below by the number'
    list_books
    print ' Enter book number : '
    book_number = gets.chomp
    puts 'Select a Person from the list below by the number'
    list_people
    person_number = gets.chomp
    print ' Enter the Date e.g (2022/10/08) : '
    date = conver_date(gets)

    rent = Rental.new(date, books[book_number.to_i - 1], people[person_number.to_i - 1])
    @rentals << rent unless @rentals.include?(rent)
    puts 'Rental Created'
    puts '-----------------------------'
  end

  def rent_list_by_id
    puts 'Rental list by ID'
    print 'Enter the person\'s ID :'
    id = gets.chomp
    puts 'Rental list'
    if @rentals.empty?
      puts 'No rental available'
    else
      @rentals.select do |rent|
        if rent.person.id == id.to_i
          puts "Date: #{rent.date}, Book '#{rent.book.title}', Author #{rent.book.author}"
        else
          puts "#{rent.person.name} has not rent a book"
        end
      end
    end
    puts '-----------------------------'
  end

  def conver_date(date)
    Date.parse(date)
  end
end
