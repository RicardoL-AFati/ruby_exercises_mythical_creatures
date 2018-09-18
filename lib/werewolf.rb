class Werewolf
  attr_reader :name, :location
  attr_accessor :human, :wolf, :hungry
  def initialize(name, location="London")
    @name = name
    @location = location
    @human = true
    @wolf = false
    @hungry = false
  end

  def human?
    human
  end

  def change!
    self.human = !human
    self.wolf = !wolf
    self.hungry = wolf?
  end

  def wolf?
    wolf
  end

  def hungry?
    hungry
  end

  def consume_victim(victim)
    consumes_if_a_wolf = {
      true => lambda {|victim| victim.status = :dead},
      false => lambda {|victim| victim}
    }
    consumes_if_a_wolf[wolf?].call(victim)
    change_hunger_if_consumed(victim)
  end

  def change_hunger_if_consumed(victim)
    no_longer_hungry_if_consumed = {
      true => false,
      false => hungry
    }
    self.hungry = no_longer_hungry_if_consumed[victim.status == :dead]
  end
end
