class SpellDirectory    #creates new spell objects
  @@all = []

  attr_accessor :spell, :type, :effect    #spell attributes

  def initialize(attribute_hash)      #use .send method to iterate over each key/value pair in hash and assign attributes
    attribute_hash.each do |k, v|
      self.send(("#{k}="), v) if self.respond_to?(("#{k}="))
    end
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_spell_name(spell) #this class method is a finder method that takes in argument
    self.all.select do |sp|
      sp.spell.downcase == spell
    end
  end
end
