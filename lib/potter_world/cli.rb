class PotterWorld::CLI

  def call
    puts "Welcome!"
    puts "To view the directory of wizards, witches, and creatures type 'view'"
    puts "To view the comprehensive spellbook, type 'view spells'"
    puts "To exit, type 'exit'"
    API.get_char_data
    API.get_spell_data
    menu
  end

  def menu 
    # puts "To view the directory of wizards, witches, and creatures type 'view'"
    # puts "To view the comprehensive spellbook, type 'view spells'"
    # puts "To exit, type 'exit'"
    input = gets.strip.downcase

    if input == "exit"
      goodbye
    elsif input == "view"
      character_list
      menu
    elsif input == "view spells"
      spell_list
      menu
    else 
      invalid_entry
      menu
    end
  end

  def character_list
    PotterDirectory.all.each_with_index do |character, index|
      puts "#{index + 1}. #{character.name}"
    end
    puts ""
    puts ""
    puts "which wizard, witch, or magical creature would you like to know more about?"
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
      menu
    end
  end

  def spell_list
    SpellDirectory.all.each_with_index do |sp, index|
      puts "#{index + 1}. #{sp.spell}"
    end
     puts ""
     puts ""
     puts "which spell would you like to know more about?"
     input = gets.strip.downcase 

    spell_selection(input)
  end

  def spell_selection(spell)
    spell = SpellDirectory.find_by_spell_name(spell)
    spell.each do |s|
      puts " Spell:".colorize(:blue) + " #{s.spell}".colorize(:green)
      puts " Type:".colorize(:blue) + " #{s.type}".colorize(:green)
      puts " Effect:".colorize(:blue) + " #{s.effect}".colorize(:green)
    end
  end

  def goodbye
    puts "Goodbye !"
  end

  def invalid_entry
    puts "Invalid entry - would you like to go back to the character directory, or the spellbook?"
    puts "Type 'spell' for spellbook, or 'dir' for directory."
    input = gets.strip.downcase

    if input == "spell"
      spell_list 
      menu 
    elsif input == "dir"
      character_list
      menu
    else 
      goodbye 
    end
  end


  #probably best to turn menu and invalid_entry methods into a loop, 
  #rather than a whole bunch of conditionals....

end