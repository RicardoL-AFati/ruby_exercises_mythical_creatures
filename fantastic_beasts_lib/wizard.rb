class Wizard
  attr_reader :name, :pure_of_heart, :parselmouth
  attr_accessor :health, :poisoned, :status, :mood
  def initialize(name, parselmouth = false, pure_of_heart = true)
    @name = name
    @pure_of_heart = pure_of_heart
    @parselmouth = parselmouth
    @health = 100
    @poisoned = false
    @status = :alive
    @mood = 'normal'
  end

  def pure_of_heart?
    pure_of_heart
  end

  def poisoned?
    poisoned
  end

  def status?
    status
  end

  def parselmouth?
    parselmouth
  end

  def duel(wizard)
    purity_of_hearts = who_is_pure_of_heart(self, wizard)
    wizard.health -= determine_damage(purity_of_hearts)
  end

  def who_is_pure_of_heart(wizard_1, wizard_2)
    [wizard_1.pure_of_heart?, wizard_2.pure_of_heart?]
  end

  def determine_damage(purity_of_hearts)
    damage_done = case purity_of_hearts
    when [true, true] then 15
    when [true, false] then 20
    when [false, true] then 15
    when [false, false] then 25
    end
    damage_done
  end
end
