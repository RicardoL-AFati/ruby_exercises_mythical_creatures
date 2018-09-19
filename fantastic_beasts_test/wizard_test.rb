gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/wizard'

class WizardTest < Minitest::Test
  def test_is_created_not_a_parselmouth_and_pure_of_heart
    ron = Wizard.new("Ron")

    assert ron.pure_of_heart?
    refute ron.parselmouth?
  end

  def test_is_created_alive_not_poisoined_and_full_health
    harry = Wizard.new("Harry")

    assert_equal :alive, harry.status?
    refute harry.poisoned?
    assert_equal 100, harry.health
  end

  def test_is_created_with_normal_mood
    harry = Wizard.new("Harry")

    assert_equal "normal", harry.mood
  end

  def test_can_duel_another_wizard_and_deal_damage
    harry = Wizard.new("Harry")
    draco = Wizard.new("Draco", true, false)

    assert_equal 100, harry.health
    assert_equal 100, draco.health

    harry.duel(draco)
    assert_equal 80, draco.health
  end

  def test_two_wizards_pure_of_heart_deal_15_damage
    harry = Wizard.new("Harry")
    ron = Wizard.new("Ron")

    assert_equal 100, harry.health
    assert_equal 100, ron.health

    harry.duel(ron)
    assert_equal 85, ron.health
    ron.duel(harry)
    assert_equal 85, ron.health
  end

  def test_an_impure_of_heart_wizard_deals_15_to_pure
    harry = Wizard.new("Harry")
    draco = Wizard.new("Draco", true, false)

    assert_equal 100, harry.health
    assert_equal 100, draco.health

    draco.duel(harry)
    assert_equal 85, harry.health
  end

  def test_two_impure_wizards_deal_25_damage
    lucius = Wizard.new("Lucius", true, false)
    bartemius = Wizard.new("Bartemius", true, false)

    assert_equal 100, lucius.health
    assert_equal 100, bartemius.health

    lucius.duel(bartemius)
    assert_equal 75, bartemius.health
    bartemius.duel(lucius)
    assert_equal 75, lucius.health
  end
end
