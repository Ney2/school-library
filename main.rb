require './app'

class Main
    def self.main_menu
        puts "Welome to our school library"
        puts "What would you like to do?"

        @list = {
            '1' => 'List all Books',
            '2' => 'List all People',
            '3' => 'Create a Person',
            '4' => 'Create a Book',
            '5' => 'Create a Rental',
            '6' => 'List all Rentals for a given person id',
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
        run.list_rentals_for_person_id
      when 7
        puts 'Goodbye and thanks for using our app'
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



