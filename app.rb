require './create_person'
require './create_book'
require './create_rental'

class App
  attr_reader :books, :person, :rentals

  def initialize
    @option = 0
    @persons = []
    @students =[]
    @teachers = []
    @rentals = []
    @books = []
    @rentals = RentalModule.new({ rentals: @rentals, persons: @persons, books: @books })
    @persons = PersonModule.new(@persons, @students, @teachers)
    @books = BooksModule.new(@books)
  end

  def menu_options
    puts 'WELCOME TO THE SCHOOL LIBRARY APP!'
    while @option != 7
      puts 'What would you like to do?'
      puts '1 - List all books'
      puts '2 - List all persons'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      start_app
    end
  end

  def start_app
    @option = gets.chomp.to_i
    case @option
    when 1
      @books.list_books
    when 2
      @persons.list_people
    when 3
      @persons.create_person
    when 4
      @books.create_new_book
    when 5
      @rentals.create_rental
    when 6
      @rentals.rent_list_by_id
    end
  end
end
