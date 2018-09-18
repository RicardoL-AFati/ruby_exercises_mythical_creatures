class Dragon
  attr_reader :name, :color, :rider
  attr_accessor :hungry, :meals_eaten
  def initialize(name, color, rider)
    @name = name
    @color = color
    @rider = rider
    @hungry = true
    @meals_eaten = 0
  end

  def hungry?
    meals_eaten < 3
  end

  def eat
    self.meals_eaten += 1
  end
end
