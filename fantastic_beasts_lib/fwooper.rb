class Fwooper
  attr_reader :sex
  attr_accessor :brilliantly_patterned_eggs,
                :sung_for_wizards_and_times,
                :brilliantly_patterned_eggs

  def initialize(sex)
    @sex = sex
    @brilliantly_patterned_eggs = 0
    @sung_for_wizards_and_times = {}
  end

  def female?
    sex == :F
  end

  def eggs?
    brilliantly_patterned_eggs
  end

  def lay_eggs
    self.brilliantly_colored_eggs += 3 if female?
  end

  def sing_for(wizard)
    if sung_for_wizards_and_times.key?(wizard)
      self.sung_for_wizards_and_times[wizard] += 1
    else
      self.sung_for_wizards_and_times[wizard] = 1
    end
    change_mood(wizard)
  end

  def change_mood(wizard)
    wizard.mood = sung_for_wizards_and_times[wizard] > 2 ? 'insane' : 'amused'
  end

  def lay_eggs
    self.brilliantly_patterned_eggs += 4 if female?
  end
end
