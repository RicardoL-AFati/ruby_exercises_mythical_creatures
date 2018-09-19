class Diricawl
  attr_reader :can_fly, :muggle_name
  attr_accessor :in_danger
  def initialize
    @in_danger = false
    @can_fly = false
    @muggle_name = 'dodo'
  end

  def try_to_capture
    self.in_danger = true
    vanish
  end

  def vanish
    return nil if not in_danger
    self.in_danger = false
    "Puff!"
  end
end
