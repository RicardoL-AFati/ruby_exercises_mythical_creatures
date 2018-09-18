class Ogre
  attr_reader :name, :home
  attr_accessor :swings, :encounter_counter
  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @swings = 0
    @encounter_counter = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    self.encounter_counter += 1
    swing_if_human_noticed = {
      true => lambda { |human| swing_at(human) },
      false => lambda {|human| human }
    }
    swing_if_human_noticed[human.notices_ogre?].call(human)
  end

  def swing_at(human)
    self.swings += 1
    knock_human_out_if_a_second_swing = {
      true => lambda {|human| human.knocked_out = true},
      false => lambda {|human| human}
    }
    knock_human_out_if_a_second_swing[second_swing?].call(human)
  end

  def second_swing?
    swings % 2 == 0
  end

  def apologize(human)
    human.knocked_out = false
  end
end
