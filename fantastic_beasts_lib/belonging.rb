class Belonging
  attr_reader :shiny
  def initialize(name, shiny=true)
    @name = name
    @shiny = shiny
  end

  def shiny?
    shiny
  end
end
