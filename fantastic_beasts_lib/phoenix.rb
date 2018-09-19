class Phoenix
  attr_accessor :age
  def initialize
    @age = 0
  end

  def age?
    age
  end

  def celebrate_birthdays(number)
    self.age += number
  end

  def regenerate
    self.age = 0
  end

  def heal_with_tears(wizard)
    wizard.health = 100
  end

  def sing(wizard)
    wizard.mood = 'courageous' if wizard.pure_of_heart?
    wizard.mood = 'fearful' if not wizard.pure_of_heart?
  end
end
