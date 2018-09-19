class Acromantula
  attr_reader :sex
  attr_accessor :eggs, :mood
  def initialize(sex)
    @sex = sex
    @eggs = 0
    @mood = 'normal'
  end

  def lay_eggs
    self.eggs += 100 if sex == :F
  end

  def snap_pincers
    "Click!" if mood == "angry"
  end

  def provoke
    self.mood = "angry"
  end

  def sex?
    sex == :M ? "Male" : "Female"
  end
end
