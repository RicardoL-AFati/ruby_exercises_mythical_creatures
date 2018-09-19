class Erumpent
  attr_reader :sex
  attr_accessor :exploded, :calfs
  def initialize(sex)
    @sex = sex
    @exploded = false
    @calfs = 0
  end

  def female?
    sex == :F
  end

  def is_wizard?(object)
    object.class == Wizard
  end

  def exploded?
    exploded
  end
  
  def charge_at(object)
    if is_wizard?(object)
      object.status = :dead
    else
      object.exploded = true
    end
  end

  def give_birth
    self.calfs += 1 if female? && !exploded?
  end
end
