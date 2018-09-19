gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/phoenix'
require_relative '../fantastic_beasts_lib/wizard'

class PhoenixTest < Minitest::Test
  def test_is_created_0_years_old
    phoenix = Phoenix.new

    assert_equal 0, phoenix.age?
  end

  def test_ages_when_celebrating_birthdays
    phoenix = Phoenix.new
    assert_equal 0, phoenix.age?

    phoenix.celebrate_birthdays(100)
    assert_equal 100, phoenix.age?
  end

  def test_can_regenerate_and_be_0_years_old
    phoenix = Phoenix.new
    assert_equal 0, phoenix.age?

    phoenix.celebrate_birthdays(100)
    assert_equal 100, phoenix.age?

    phoenix.regenerate
    assert_equal 0, phoenix.age?
  end

  def test_can_heal_a_wizard_with_tears
    fawkes = Phoenix.new
    harry = Wizard.new("Harry")

    harry.health = 20
    assert_equal 20, harry.health

    fawkes.heal_with_tears(harry)
    assert_equal 100, harry.health
  end

  def test_phoenix_song_strikes_fear_into_those_impure_of_heart
    fawkes = Phoenix.new
    draco = Wizard.new("Draco", true, false)

    assert_equal "normal", draco.mood
    fawkes.sing(draco)
    assert_equal "fearful", draco.mood
  end

  def test_phoenix_song_increases_courage_for_those_pure_of_heart
    fawkes = Phoenix.new
    harry = Wizard.new("Draco", true, true)

    assert_equal "normal", harry.mood
    fawkes.sing(harry)
    assert_equal "courageous", harry.mood
  end
end
