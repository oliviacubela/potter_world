class API
# require 'pry'
# require 'json'
# require 'rest-client'

  def self.get_char_data

      response = RestClient.get("https://www.potterapi.com/v1/characters?key=$2a$10$dzneyObJXfMmDwbSJS1LtONfqk526gSxHIl/ukaNki3OOSDwyw.JK")
      characters = JSON.parse(response.body)
      # binding.pry
      characters.each do |character|
        PotterDirectory.new(character)

    end
  end


  #Look at self.scrape_profile_page method in Scraper class. 
  # maybe look at 'add_student_attributes' method in student scraper lab, in 'Student' class too...
  #dynamically assigns the student attributes and values per the key/value pais of the hash using send method


  def self.get_spell_data
      response = RestClient.get("https://www.potterapi.com/v1/spells?key=$2a$10$dzneyObJXfMmDwbSJS1LtONfqk526gSxHIl/ukaNki3OOSDwyw.JK")
      spells = JSON.parse(response.body)

      spells.each do |spell|
        SpellDirectory.new(spell)
      
    end
  end
end