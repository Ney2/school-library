require 'json'

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

  def to_json(*_args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals
    }
  end
end
