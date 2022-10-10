require './app'

class Main
  def main
    run = App.new
    run.menu_options
  end

  def exit
    puts 'Thank you for using our app!'
  end
end

main = Main.new
main.main
main.exit
