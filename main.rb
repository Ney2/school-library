require './app'

class App
  def self.main_menu
    puts 'Welome to our school library'
    puts 'What would you like to do?'

    @list = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rental for a given person id',
      '7' => 'Exit'
    }

    @list.each do |key, value|
      puts "#{key} - #{value}"
    end

    Integer(gets.chomp)
  end

  run = Apps.new

  loop do
    case main_menu
    when 1
      run.list_books
    when 2
      run.list_people
    when 3
      run.create_person
    when 4
      run.create_new_book
    when 5
      run.create_rental
    when 6
      run.rent_list_by_id
    when 7
      puts 'Goodbye, Thank you for using the app'
      exit
    else
      puts 'Invalid entry, please choose only from the menu'
    end
  end
end

def main
  App.new
end

main
