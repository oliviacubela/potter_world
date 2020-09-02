class PotterWorld::CLI 

  def call     
    input = ""

    API.get_char_data  
    API.get_spell_data  

    while input != "exit"
      puts "Welcome!"       
      puts "To view the directory of wizards, witches, and creatures type 'view'"
      puts "To view the comprehensive spellbook, type 'view spells'"
      puts "To exit, type 'exit'"
      puts "What would you like to see first?"

      input = gets.strip.downcase

      case input               
      when "view"
        character_list
      when "view spells"     
        spell_list
      end
    end
  end

  def character_list
    CharacterDirectory.all.sort{ |a, b| a.name <=> b.name }.each_with_index do |character, index|
      puts "#{index + 1}. #{character.name}"
    end
    puts ""
    puts ""
    puts "which wizard, witch, or magical creature would you like to know more about?"
    input = gets.strip.downcase
    
    character_selection(input)
  end

  def character_selection(character)                
    char = CharacterDirectory.find_by_name(character)  
    char.each do |c|
      puts " Name:".colorize(:red) + " #{c.name}".colorize(:yellow)
      puts " Role:".colorize(:red) + " #{c.role}".colorize(:yellow) if c.role 
      puts " House:".colorize(:red) + " #{c.house}".colorize(:yellow) if c.house
      puts " School:".colorize(:red) + " #{c.school}".colorize(:yellow) if c.school
      puts " Species:".colorize(:red) + " #{c.species}".colorize(:yellow) if c.species
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
end