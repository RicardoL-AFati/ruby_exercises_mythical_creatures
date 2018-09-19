gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/fwooper'
require_relative '../fantastic_beasts_lib/wizard'

class FwooperTest < Minitest::Test
  def test_no_eggs_when_created
    fwooper = Fwooper.new(:M)

    assert_equal 0, fwooper.eggs?
  end

  def test_will_not_lay_eggs_if_male
    fwooper = Fwooper.new(:M)

    assert_equal 0, fwooper.eggs?
    assert_nil fwooper.lay_eggs
    assert_equal 0, fwooper.eggs?
  end

  def test_will_lay_eggs_if_female
    fwooper = Fwooper.new(:F)

    assert_equal 0, fwooper.eggs?
    fwooper.lay_eggs
    assert_equal 4, fwooper.eggs?
  end

  def test_knows_what_wizards_its_sang_for_and_number_of_times
    fwooper = Fwooper.new(:F)
    newt = Wizard.new("Newt")
    dumbledore = Wizard.new("Dumbledore")

    fwooper.sing_for(newt)
    assert fwooper.sung_for_wizards_and_times.key?(newt)
    assert_equal 1, fwooper.sung_for_wizards_and_times[newt]

    fwooper.sing_for(dumbledore)
    fwooper.sing_for(dumbledore)
    assert fwooper.sung_for_wizards_and_times.key?(dumbledore)
    assert_equal 2, fwooper.sung_for_wizards_and_times[dumbledore]
  end

  def test_amuses_wizard_first_two_sings
    fwooper = Fwooper.new(:F)
    newt = Wizard.new("Newt")

    fwooper.sing_for(newt)
    assert_equal 'amused', newt.mood
    fwooper.sing_for(newt)
    assert_equal 'amused', newt.mood
  end

  def test_causes_insanity_if_three_or_more_sings
    fwooper = Fwooper.new(:F)
    newt = Wizard.new("Newt")

    fwooper.sing_for(newt)
    assert_equal 'amused', newt.mood
    fwooper.sing_for(newt)
    assert_equal 'amused', newt.mood
    fwooper.sing_for(newt)
    assert_equal 'insane', newt.mood
    fwooper.sing_for(newt)
    assert_equal 'insane', newt.mood
  end
end
