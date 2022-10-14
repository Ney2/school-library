require './books'
require './rental'
require './persons'

describe Book do
  context 'When testing the Book class' do
    it 'Should Create a Book' do
      new_book = Book.new('Animal Farm', 'George Orwell')
      expect(new_book.title).to eq('Animal Farm')
      expect(new_book.author).to eq('George Orwell')
    end

    it 'Should be instance of Book' do
      new_book = Book.new('Animal Farm', 'George Orwell')
      expect(new_book).to be_instance_of(Book)
    end

    it 'Should Create a Rental' do
      person = Person.new(20, 'John')
      book = Book.new('Animal Farm', 'George Orwell')
      rental = Rental.new('2020-10-10', person, book)
      book.add_rental(rental)
      expect(book.rentals.length).to eq(1)
    end
  end
end
