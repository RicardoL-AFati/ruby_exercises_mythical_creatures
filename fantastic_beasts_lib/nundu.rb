class Nundu
  attr_reader :found_in
  attr_accessor :subdued
  def initialize
    @found_in = 'East Africa'
    @subdued = false
  end

  def breathe_on(*wizards)
    wizards.each {|wizard| wizard.status = :dead}
  end

  def subdued?
    subdued
  end
  
  def subdue(group_of_skilled_wizards)
    self.subdued = true if group_of_skilled_wizards.count >= 100
  end
end
