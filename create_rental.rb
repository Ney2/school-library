require './rental'
require 'date'

class RentalModule
  attr_accessor :rentals, :books, :persons

  def initialize(params)
    @books = params[:books]
    @persons = params[:persons]
    @rentals = params[:rentals]
  end

  def create_rental
    puts ' Select a Book from the list below by the number'
    if @books.empty?
        puts 'No available books'
        return
      end
      @books.each_with_index do |book, index|
        puts " #{index + 1} - Title: \"#{book.title}\", Author: #{book.author}"
      end
      puts '-----------------------------'
    print ' Enter book number : '
    book_number = gets.chomp
    puts 'Select a Person from the list below by the number'
    if @persons.empty?
        puts 'No person available'
        return
      end
      @persons.each_with_index do |person, index|
        puts "#{index + 1} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      puts '-----------------------------'
    person_number = gets.chomp
    print ' Enter the Date e.g (2022/10/08) : '
    date = conver_date(gets)

    rent = Rental.new(date, books[book_number.to_i - 1], persons[person_number.to_i - 1])
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
