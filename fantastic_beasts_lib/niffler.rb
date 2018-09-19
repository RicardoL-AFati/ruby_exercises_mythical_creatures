class Niffler
  attr_reader :sex
  attr_accessor :children, :treasures
  def initialize(sex)
    @sex = sex
    @children = 0
    @treasures = []
  end

  def female?
    sex == :F
  end

  def give_birth
    self.children += rand(6..8) if female?
  end

  def steal_belongings(belonging_container)
    belonging_container.each do |belonging|
      self.treasures.push(belonging) if belonging.shiny?
    end
  end
end
