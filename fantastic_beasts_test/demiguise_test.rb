gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/demiguise'

class DemiguiseTest < Minitest::Test
  def test_is_created_with_peaceful_mood
    demiguise = Demiguise.new

    assert_equal "peaceful", demiguise.mood
  end

  def test_mood_can_become_threatened
    demiguise = Demiguise.new

    assert_equal "peaceful", demiguise.mood

    demiguise.threaten
    assert_equal "threatened", demiguise.mood
  end

  def wont_turn_invisible_if_not_threatened
    demiguise = Demiguise.new

    assert_equal "peaceful", demiguise.mood

    assert_nil demiguise.turn_invisible
  end

  def turns_invisible_when_threatened
    demiguise = Demiguise.new

    assert_equal "peaceful", demiguise.mood

    demiguise.threaten
    assert demiguise.invisible
  end
end
