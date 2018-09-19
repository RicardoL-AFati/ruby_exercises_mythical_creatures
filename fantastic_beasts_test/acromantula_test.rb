gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/acromantula'

class AcromantulaTest < Minitest::Test
  def test_is_created_with_no_eggs
    aragog = Acromantula.new(:M)

    assert_equal 0, aragog.eggs
  end

  def test_is_created_with_a_sex
    aragog = Acromantula.new(:M)

    assert_equal "Male", aragog.sex?
  end

  def test_created_with_normal_mood
    aragog = Acromantula.new(:M)

    assert_equal "normal", aragog.mood
  end

  def test_provoking_changes_mood_to_angry
    aragog = Acromantula.new(:M)

    aragog.provoke
    assert_equal "angry", aragog.mood
  end

  def test_will_not_snap_pincers_if_normal_mood
    aragog = Acromantula.new(:M)

    assert_nil aragog.snap_pincers
  end

  def test_will_snap_pincers_if_angry_mood
    aragog = Acromantula.new(:M)

    aragog.provoke
    assert_equal "Click!", aragog.snap_pincers
  end

  def test_will_not_lay_eggs_if_male
    aragog = Acromantula.new(:M)

    assert_nil aragog.lay_eggs
    assert_equal 0, aragog.eggs
  end

  def test_will_lay_eggs_if_female
    aragoga = Acromantula.new(:F)

    aragoga.lay_eggs
    assert_equal 100, aragoga.eggs
  end

  def test_can_lay_eggs_multiple_times
    aragoga = Acromantula.new(:F)

    aragoga.lay_eggs
    aragoga.lay_eggs
    aragoga.lay_eggs

    assert_equal 300, aragoga.eggs
  end
end
