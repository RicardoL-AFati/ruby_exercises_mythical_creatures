class Demiguise
  attr_accessor :invisible, :mood
  def initialize
    @mood = 'peaceful'
    @invisible = false
  end

  def turn_invisible
    self.invisible = true if mood == 'threatened'
  end

  def threaten
    self.mood = 'threatened'
    turn_invisible
  end
end
