gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/doxy'
require_relative '../fantastic_beasts_lib/wizard'

class DoxyTest < Minitest::Test
  def test_is_created_with_no_eggs
    doxy = Doxy.new(:F)

    assert_equal 0, doxy.eggs
  end

  def test_is_created_with_no_children
    doxy = Doxy.new(:M)

    assert_equal 0, doxy.children
  end

  def test_known_by_another_name
    doxy = Doxy.new(:F)

    assert_equal "biting fairy", doxy.also_known_as
  end

  def test_poisons_a_wizard_with_bite
    doxy = Doxy.new(:M)
    harry = Wizard.new("Harry")

    refute harry.poisoned?

    doxy.bite(harry)
    assert harry.poisoned?
  end

  def test_is_female_if_created_female
    doxy = Doxy.new(:F)

    assert doxy.female?
  end

  def test_wont_lay_eggs_if_male
    doxy = Doxy.new(:M)

    assert_nil doxy.lay_eggs
  end

  def test_wont_wait_for_eggs_if_male
    doxy = Doxy.new(:M)

    assert_nil doxy.wait_three_weeks
  end

  def test_wont_wait_for_eggs_if_there_are_none
    doxy = Doxy.new(:F)

    assert_nil doxy.wait_three_weeks
  end
  
  def test_lays_eggs_if_female
    doxy = Doxy.new(:F)

    doxy.lay_eggs
    assert_equal 500, doxy.eggs
  end

  def test_eggs_become_children_after_three_weeks
    doxy = Doxy.new(:F)

    doxy.lay_eggs
    assert_equal 500, doxy.eggs

    doxy.wait_three_weeks
    assert_equal 0, doxy.eggs
    assert_equal 500, doxy.children
  end
end
