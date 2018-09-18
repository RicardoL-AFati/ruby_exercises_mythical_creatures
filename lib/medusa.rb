class Medusa
  attr_reader :name
  attr_accessor :statues
  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    victim.stoned = true
    add_or_unstone = {
      false => lambda { |victim| add_to_statues(victim) },
      true => lambda { |victim| unstone_first_and_add(victim) }
    }
    add_or_unstone[has_three_victims?].call(victim)
  end

  def has_three_victims?
    statues.count == 3
  end

  def add_to_statues(victim)
    self.statues.push(victim)
  end

  def unstone_first_and_add(victim)
    self.statues.first.stoned = false
    self.statues.shift
    add_to_statues(victim)
  end
end
