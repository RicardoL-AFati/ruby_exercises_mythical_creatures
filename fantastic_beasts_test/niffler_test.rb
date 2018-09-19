gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/niffler'
require_relative '../fantastic_beasts_lib/belonging'

class NifflerTest < Minitest::Test
  def test_has_no_treasures_when_created
    niffler = Niffler.new(:F)

    assert niffler.treasures.empty?
  end

  def test_has_no_children_when_created
    niffler = Niffler.new(:F)

    assert_equal 0, niffler.children
  end

  def test_does_not_give_birth_if_male
    niffler = Niffler.new(:M)

    assert_equal 0, niffler.children
    assert_nil niffler.give_birth
    assert_equal 0, niffler.children
  end

  def test_gives_birth_to_over_six_children_if_female
    niffler = Niffler.new(:F)

    assert_equal 0, niffler.children
    niffler.give_birth
    assert_includes 6..8, niffler.children
  end

  def test_it_does_not_steal_not_shiny_belonings
    niffler = Niffler.new(:M)
    belongings = (1..3).map do |n|
      belonging = Belonging.new("belonging-#{n}", false)
    end

    assert_empty niffler.treasures
    niffler.steal_belongings(belongings)
    assert_empty niffler.treasures
  end

  def test_it_does_steal_shiny_belongings
    niffler = Niffler.new(:M)
    belongings = [
    belonging_1 = Belonging.new("Broom", false),
    belonging_2 = Belonging.new("Bracelet"),
    belonging_3 = Belonging.new("Pearl Necklace")
    ]
    assert_empty niffler.treasures
    niffler.steal_belongings(belongings)
    assert_equal 2, niffler.treasures.count
  end
end
