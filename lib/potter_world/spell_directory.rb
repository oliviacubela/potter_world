class SpellDirectory
  @@all = []

  attr_accessor :spell, :type, :effect

  def initialize(attribute_hash)
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

  def self.find_by_spell_name(spell)
    self.all.select do |sp|
      sp.spell.downcase == spell
    end
  end
#PotterDirectory & SpellDirectory have the same function/perform the same operations 
#does this violate DRY ? Should I use inheritance/include/extend??

end
