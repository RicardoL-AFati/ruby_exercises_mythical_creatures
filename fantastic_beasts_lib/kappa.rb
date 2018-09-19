class Kappa
  attr_accessor :filled_head,
                :cucumbers,
                :strong

  def initialize
    @filled_head = true
    @cucumbers = []
    @strong = true
  end

  def strong?
    strong
  end

  def filled_head?
    filled_head
  end

  def feed_on_blood(wizard)
    unless have_cucumber_with_wizards_name?(wizard.name) || !strong?
      wizard.status = :dead
    end
  end

  def have_cucumber_with_wizards_name?(wizard_name)
    cucumbers.include?(wizard_name)
  end

  def throw_cucumber(wizard_name)
    self.cucumbers.push(wizard_name)
  end

  def trick_into_bowing
    self.filled_head = false
    self.strong = false
  end

  def go_in_river
    self.filled_head = true
    self.strong = true
  end
end
