require './books'

class BooksModule
  attr_accessor :books

  def initialize(books)
    @books = books
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
end
