require './rental'
require './books'
require './persons'

describe Rental do
  context 'When testing the Rental class' do
    it 'Should Create a Rental' do
      person = Person.new(20, 'John')
      book = Book.new('Animal Farm', 'George Orwell')
      rental = Rental.new('2020-10-10', person, book)
      expect(rental.date).to eq('2020-10-10')
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'Should be instance of Rental' do
      person = Person.new(20, 'John')
      book = Book.new('Animal Farm', 'George Orwell')
      rental = Rental.new('2020-10-10', person, book)
      expect(rental).to be_instance_of(Rental)
    end

    it 'Should Create a Rental' do
      person = Person.new(20, 'John')
      book = Book.new('Animal Farm', 'George Orwell')
      rental = Rental.new('2020-10-10', person, book)
      expect(rental.to_json).to eq(
        {
          'json_class' => 'Rental',
          'date' => '2020-10-10',
          'book' => book,
          'person' => person
        }
      )
    end
  end
end
