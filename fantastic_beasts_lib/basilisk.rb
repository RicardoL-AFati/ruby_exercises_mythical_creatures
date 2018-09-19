class Basilisk
  attr_accessor :owner
  def initialize
    @owner = nil
  end

  def bite(wizard)
    wizard.poisoned = true
  end

  def gaze(wizard)
    wizard.status = :dead
  end

  def assign_owner(wizard)
    self.owner = wizard if wizard.parselmouth
  end
end
