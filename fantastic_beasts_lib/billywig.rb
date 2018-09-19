class BillyWig
  attr_reader :color, :native_to
  def initialize
    @color = "vivid sapphire blue"
    @native_to = 'Australia'
  end

  def sting(wizard)
    wizard.mood = 'giddy'
  end
end
