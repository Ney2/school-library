require './persons'
require './student'
require './teacher'
require './rental'
require './books'

describe Person do
  context 'When testing the Person class' do
    it 'Should Create a Person' do
      person = Person.new(22, 'Kidist')
      expect(person.name).to eq('Kidist')
      expect(person.age).to eq(22)
    end

    it 'Should be instance of Person' do
      person = Person.new(22, 'Kidist')
      expect(person).to be_instance_of(Person)
    end

    it 'Should Create a Rental' do
      person = Person.new(20, 'John')
      book = Book.new('Animal Farm', 'George Orwell')
      rental = Rental.new('2020-10-10', person, book)
      book.add_rental(rental)
      expect(book.rentals.length).to eq(1)
    end

    it 'Should have a correct name' do
      person = Person.new(22, 'Kidist')
      expect(person.correct_name).to eq('Kidist')
    end
  end
end
