gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/kappa'
require_relative '../fantastic_beasts_lib/wizard'

class KappaTest < Minitest::Test
  def test_is_strong_when_created
    kappa = Kappa.new

    assert kappa.strong?
  end

  def test_has_filled_head_when_created
    kappa = Kappa.new

    assert kappa.filled_head?
  end

  def test_has_no_cucumbers_when_created
    kappa = Kappa.new

    assert kappa.cucumbers.empty?
  end

  def test_can_feed_on_blood_of_wizard_and_kill
    kappa = Kappa.new
    newt = Wizard.new("Newt")

    assert_equal :alive, newt.status?
    kappa.feed_on_blood(newt)
    assert_equal :dead, newt.status?
  end

  def test_can_be_persuaded_not_to_feed_with_cucumber
    kappa = Kappa.new
    newt = Wizard.new("Newt")

    assert_equal :alive, newt.status?

    kappa.throw_cucumber(newt.name)
    kappa.feed_on_blood(newt)
    assert_equal :alive, newt.status?
  end

  def test_can_be_tricked_into_bowing_and_spilling_head_water
    kappa = Kappa.new

    assert kappa.filled_head?
    kappa.trick_into_bowing
    refute kappa.filled_head?
  end

  def test_loses_strength_with_no_water_in_head
    kappa = Kappa.new

    assert kappa.filled_head?
    kappa.trick_into_bowing
    refute kappa.filled_head?
    refute kappa.strong?
  end

  def test_cant_feed_on_blood_without_strength
    kappa = Kappa.new
    newt = Wizard.new("Newt")

    assert kappa.filled_head?
    kappa.trick_into_bowing
    refute kappa.strong?
    assert_nil kappa.feed_on_blood(newt)
  end

  def test_can_regain_water_and_strength
    kappa = Kappa.new

    assert kappa.filled_head?
    kappa.trick_into_bowing
    refute kappa.filled_head?
    refute kappa.strong?
    kappa.go_in_river
    assert kappa.filled_head?
    assert kappa.strong?
  end
end
