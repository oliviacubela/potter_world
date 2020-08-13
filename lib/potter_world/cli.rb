class PotterWorld::CLI

  def call
    puts "Hello User"
    puts "To view the directory of wizards and witches, type 'view'"
    puts "To exit the directory, type 'exit'"
    API.get_data
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
    PotterDirectory.all.each_with_index do |character, index|
      puts "#{index + 1}. #{character.name}"
    end
    puts ""
    puts ""
    puts "which wizard or witch would you like to know more about?"
    input = gets.strip.downcase
    
    character_selection(input)
  end

  def character_selection(character)
    char = PotterDirectory.find_by_name(character)
    char.each do |c|
      puts " Name:".colorize(:red) + " #{c.name}".colorize(:yellow)
      puts " Role:".colorize(:red) + " #{c.role}".colorize(:yellow)
      puts " House:".colorize(:red) + " #{c.house}".colorize(:yellow)
      puts " School:".colorize(:red) + " #{c.school}".colorize(:yellow)
      puts " Species:".colorize(:red) + " #{c.species}".colorize(:yellow)

    end

  end

  def goodbye
    puts "Goodbye !"
  end

  def invalid_entry
    puts "Invalid entry, try again"
    menu
  end



end