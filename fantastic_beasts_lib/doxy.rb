class Doxy
  attr_accessor :eggs, :children
  attr_reader :sex, :also_known_as
  def initialize(sex)
    @sex = sex
    @eggs = 0
    @children = 0
    @also_known_as = 'biting fairy'
  end

  def bite(wizard)
    wizard.poisoned = true
  end

  def female?
    sex == :F
  end

  def lay_eggs
    self.eggs += 500 if female?
  end

  def wait_three_weeks
    return nil if !female? || eggs == 0
    self.eggs = 0
    self.children = 500
  end
end
