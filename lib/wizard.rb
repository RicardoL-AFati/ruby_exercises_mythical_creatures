class Wizard
  attr_reader :name, :bearded
  attr_accessor :rested, :cast_spells
  def initialize(name, beard_hash={bearded: true})
    @name = name
    @bearded = beard_hash[:bearded]
    @rested = true
    @cast_spells = 0
  end

  def bearded?
    bearded
  end

  def incantation(spell)
    "sudo #{spell}"
  end

  def rested?
    rested
  end

  def cast
    self.cast_spells += 1
    self.rested = cast_spells < 3
    "STUPIFY!"
  end
end
