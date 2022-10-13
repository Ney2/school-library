require './books'
require 'json'

class BooksModule
  attr_accessor :books
  attr_reader :file_location

  def initialize
    @file_location = 'storage/books.json'
    file = File.open(@file_location, 'a+')
    @books = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  def create_new_book
    file = File.open(@file_location, 'w')
    puts 'Enter book\'s title: '
    title = gets.chomp

    puts 'Enter book\'s author: '
    author = gets.chomp

    book = Book.new(title, author)
    book = book.to_json
    @books << book
    file.write(JSON[@books])
    file.close
    puts
    puts 'Book created successfully'
    puts
    sleep(2)
  end

  def list_books
    if @books.length.positive?
      @books.each { |book| puts "Title: '#{book['title']}' by Author: #{book['author']}" }
    else
      puts
      puts 'There are no books'
    end
    puts
  end
end
