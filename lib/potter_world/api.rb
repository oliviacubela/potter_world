class API

  def self.get_char_data
      response = RestClient.get("https://www.potterapi.com/v1/characters?key=$2a$10$dzneyObJXfMmDwbSJS1LtONfqk526gSxHIl/ukaNki3OOSDwyw.JK")
      characters = JSON.parse(response.body)

      characters.each do |character|
        PotterDirectory.new(character)

    end
  end

  def self.get_spell_data
      response = RestClient.get("https://www.potterapi.com/v1/spells?key=$2a$10$dzneyObJXfMmDwbSJS1LtONfqk526gSxHIl/ukaNki3OOSDwyw.JK")
      spells = JSON.parse(response.body)

      spells.each do |spell|
        SpellDirectory.new(spell)
      
    end
  end
end