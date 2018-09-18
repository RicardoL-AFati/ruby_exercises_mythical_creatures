class Pirate
  attr_reader :name, :job
  attr_accessor :heinous_acts, :cursed, :booty
  def initialize(name, job="Scallywag")
    @name = name
    @job = job
    @cursed = false
    @heinous_acts = 0
    @booty = 0
  end

  def commit_heinous_act
    self.heinous_acts += 1
    self.cursed = too_many_heinous_acts?
  end

  def cursed?
    cursed
  end

  def too_many_heinous_acts?
    heinous_acts >= 3
  end

  def rob_ship
    self.booty += 100
  end
end
