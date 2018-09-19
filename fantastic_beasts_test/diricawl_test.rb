gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/diricawl'

class DiricawlTest < Minitest::Test
  def test_diricawls_are_flightless
    diricawl = Diricawl.new

    refute diricawl.can_fly
  end

  def test_what_muggles_called_diricawls
    diricawl = Diricawl.new

    assert_equal "dodo", diricawl.muggle_name
  end

  def test_not_in_danger_when_created
    diricawl = Diricawl.new

    refute diricawl.in_danger
  end

  def test_vanishes_when_attempted_capture
    diricawl = Diricawl.new

    assert_equal "Puff!", diricawl.try_to_capture
  end

  def wont_vanish_if_not_in_danger
    diricawl = Diricawl.new

    assert_nil diricawl.vanish
  end
end
