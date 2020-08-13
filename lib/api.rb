class API

  def self.get_data
      response = RestClient.get("https://www.potterapi.com/v1/characters?key=$2a$10$dzneyObJXfMmDwbSJS1LtONfqk526gSxHIl/ukaNki3OOSDwyw.JK")
      characters = JSON.parse(response.body)

      characters.each do |character|
        PotterDirectory.new(character)

    end
  end
end