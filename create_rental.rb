require './rental'

class RentalModule
  attr_accessor :books, :persons, :rentals, :file_location

  def initialize(books, persons)
    @file_location = 'storage/rentals.json'
    @books = books
    @persons = persons
    file = File.open(@file_location, 'a+')
    @rentals = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  def create_rental
    file = File.open(@file_location, 'w')
    if @books.empty? == false || @persons.empty? == false
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}" }

      book_index = gets.chomp.to_i
      book_obj = @books[book_index]

      puts 'Select a person from the following list by number'
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person['json_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
      person_index = gets.chomp.to_i
      person_obj = @persons[person_index]

      puts 'Enter date: '
      date = gets.chomp

      rental = Rental.new(date, person_obj, book_obj)
      rental = rental.to_json
      @rentals << rental
      file.write(JSON[@rentals])
      file.close
      puts "New rental created for #{person_obj['name']}"
    else
      puts
      puts 'No books or persons found. Please create at least one book and person first.'
      puts
    end
  end

  def rent_list_by_id
    puts 'Enter person ID: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental['date']}, Book \"#{rental['book']['title']}\" by #{rental['book']['author']}" if rental['person']['id'] == person_id
    end
    puts 'No rentals found' if @rentals.none? { |rental| rental['person']['id'] == person_id }
  end
end
