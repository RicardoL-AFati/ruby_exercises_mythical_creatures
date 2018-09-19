gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/basilisk'
require_relative '../fantastic_beasts_lib/wizard'

class BasiliskTest < Minitest::Test
  def test_is_created_with_no_owner
    basilisk = Basilisk.new

    assert_nil basilisk.owner
  end

  def test_it_poisons_a_wizard_with_biting
    basilisk = Basilisk.new
    harry = Wizard.new("Harry")

    refute harry.poisoned?

    basilisk.bite(harry)
    assert harry.poisoned?
  end

  def test_it_kills_wizard_with_gaze
    basilisk = Basilisk.new
    harry = Wizard.new("Harry")

    assert_equal :alive, harry.status?

    basilisk.gaze(harry)
    assert_equal :dead, harry.status?
  end

  def test_will_not_assign_owner_if_not_parselmouth
    basilisk = Basilisk.new
    ron = Wizard.new("Ron")

    refute ron.parselmouth?

    assert_nil basilisk.assign_owner(ron)
  end

  def test_will_assign_owner_if_parselmouth
    basilisk = Basilisk.new
    tom_riddle = Wizard.new("Tom", true)

    assert tom_riddle.parselmouth?

    basilisk.assign_owner(tom_riddle)
    assert_equal "Tom", basilisk.owner.name
  end
end
