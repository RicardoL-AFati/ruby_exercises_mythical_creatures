gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/nundu'
require_relative '../fantastic_beasts_lib/wizard'

class NunduTest < Minitest::Test
  def test_is_found_in_east_africa
    nundu = Nundu.new

    assert_equal "East Africa", nundu.found_in
  end

  def test_is_not_subdued_when_created
    nundu = Nundu.new

    refute nundu.subdued?
  end

  def test_it_cannot_be_subdued_by_less_than_100_wizards
    nundu = Nundu.new
    wizards = (1..99).map do |n|
      wizard = Wizard.new("wizard-#{n}")
      wizard
    end

    refute nundu.subdued?
    nundu.subdue(wizards)
    refute nundu.subdued?
  end

  def test_it_is_subdued_by_100_wizards
    nundu = Nundu.new
    wizards = (1..100).map do |n|
      wizard = Wizard.new("wizard-#{n}")
      wizard
    end

    refute nundu.subdued?
    nundu.subdue(wizards)
    assert nundu.subdued?
  end
end
