class PotterWorld::CLI

  def call
    puts "Hello User"
    puts "To view the directory of wizards and withches, type 'view'"
    puts "To exit the directory, type 'exit"
    menu
  end

  def menu 
    input = gets.strip.downcase

    if input == "view"
      character_list 
      menu 
    elsif input == "exit"
      goodbye 
    else 
      invalid_entry 
    end
  end

  def character_list
    puts "1. character 1"
    puts "2. character 2"
    puts "3. character 3"
    puts ""
    puts ""
    puts "which wizard or witch would you like to know more about?"
    input = gets.strip.downcase
    
    character_selection(input)
  end

  def character_selection(character)
    #go over character array, create find method to find character selected

  end

  def goodbye
    puts "Goodbye !"
  end

  def invalid_entry
    puts "Invalid entry, try again"
    menu
  end



end