class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  attr_reader :rentals
  attr_accessor :title, :author
end
