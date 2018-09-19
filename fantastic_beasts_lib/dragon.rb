class Dragon
  attr_reader :breed, :sex
  attr_accessor :hungry, :in_flight, :eggs, :wizards_eaten
  def initialize(breed, sex)
    @breed = breed
    @hungry = true
    @in_flight = false
    @sex = sex
    @eggs = 0
    @wizards_eaten = []
  end

  def female?
    sex == :F
  end

  def lay_eggs
    self.eggs += 5 if female?
  end

  def hungry?
    hungry
  end

  def eat_wizard(wizard)
    wizard.status = :dead
    self.wizards_eaten.push(wizard)
    self.hungry = false
  end

  def how_many_wizards_eaten?
    wizards_eaten.count
  end

  def eat
    self.hungry = false
  end

  def fly
    self.in_flight = true
  end

  def land
    self.in_flight = false
  end

  def in_flight?
    in_flight
  end

  def breathe_fire
    puts "\u{1F525}\u{1F525}\u{1F525}\u{1F525}\u{1F525}"
  end
end
