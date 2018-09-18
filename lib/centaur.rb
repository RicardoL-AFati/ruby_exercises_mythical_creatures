class Centaur
  attr_reader :name, :breed
  attr_accessor :standing, :cranky, :actions, :healthy
  def initialize(name, breed)
    @name = name
    @breed = breed
    @standing = true
    @cranky = false
    @actions = 0
    @healthy = true
  end

  def shoot
    will_shoot = {true => "Twang!!!", false => "NO!"}
    shoot_return = will_shoot[not_cranky_or_laying_down?]
    add_to_actions
    shoot_return
  end

  def run
    will_run = {true => "Clop clop clop clop!!!", false => "NO!"}
    run_return = will_run[not_cranky_or_laying_down?]
    add_to_actions
    run_return
  end

  def drink_potion
    will_drink_if_standing = {false => "NO!", true => "gulp!"}
    rested_if_standing = {false => actions, true => 0}
    sick_if_drinks_while_rested = {false => healthy, true => false}

    self.healthy = sick_if_drinks_while_rested[standing? && rested?]
    self.actions = rested_if_standing[standing?]

    will_drink_if_standing[standing?]
  end

  def not_cranky_or_laying_down?
    !cranky? && !laying?
  end

  def add_to_actions
    self.actions += 1
  end

  def over_worked?
    actions >= 3
  end

  def cranky?
    self.cranky = over_worked?
  end

  def laying?
    !standing
  end

  def standing?
    standing
  end

  def rested?
    actions == 0
  end

  def sleep
    will_sleep_if_laying = {false => "NO!", true => "zzz"}
    not_cranky_if_laying = {false => cranky, true => false}
    actions_reset_if_laying = {false => actions, true => 0}
    self.cranky = not_cranky_if_laying[laying?]
    self.actions = actions_reset_if_laying[laying?]
    will_sleep_if_laying[laying?]
  end

  def lay_down
    self.standing = false
  end

  def stand_up
    self.standing = true
  end
end
