gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/medusa'
require_relative '../lib/person'

class MedusaTest < Minitest::Test
  def test_it_has_a_name
    medusa = Medusa.new("Cassiopeia")
    assert_equal "Cassiopeia", medusa.name
  end

  def test_when_first_created_she_has_no_statues
    medusa = Medusa.new("Cassiopeia")
    assert medusa.statues.empty?
  end

  def test_when_staring_at_a_person_she_gains_a_statue
    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")

    medusa.stare(victim)
    assert_equal 1, medusa.statues.count
    assert_equal "Perseus", medusa.statues.first.name
  end

  def test_when_staring_at_a_person_that_person_turns_to_stone
    medusa = Medusa.new("Cassiopeia")
    victim = Person.new("Perseus")

    refute victim.stoned?
    medusa.stare(victim)
    assert victim.stoned?
  end

  def test_can_only_have_three_victims
    medusa = Medusa.new("Cassiopeia")
    victim_1 = Person.new("Perseus")
    victim_2 = Person.new("Deseus")
    victim_3 = Person.new("Merseus")
    victim_4 = Person.new("Odeseus")

    medusa.stare(victim_1)
    assert victim_1.stoned?
    assert medusa.statues.count == 1

    medusa.stare(victim_2)
    assert victim_2.stoned?
    assert medusa.statues.count == 2

    medusa.stare(victim_3)
    assert victim_3.stoned?
    assert medusa.statues.count == 3

    medusa.stare(victim_4)
    assert victim_4.stoned?
    refute medusa.statues.count == 4
  end

  def test_if_a_fourth_victim_is_stoned_first_is_unstoned
    medusa = Medusa.new("Cassiopeia")
    victim_1 = Person.new("Perseus")
    victim_2 = Person.new("Deseus")
    victim_3 = Person.new("Merseus")
    victim_4 = Person.new("Odeseus")

    medusa.stare(victim_1)
    medusa.stare(victim_2)
    medusa.stare(victim_3)
    medusa.stare(victim_4)

    refute victim_1.stoned?
  end

  def test_if_adding_fourth_victim_removes_first
    medusa = Medusa.new("Cassiopeia")
    victim_1 = Person.new("Perseus")
    victim_2 = Person.new("Deseus")
    victim_3 = Person.new("Merseus")
    victim_4 = Person.new("Odeseus")

    medusa.stare(victim_1)
    medusa.stare(victim_2)
    medusa.stare(victim_3)
    assert medusa.statues.count == 3
    medusa.stare(victim_4)
    assert medusa.statues.count == 3

    refute medusa.statues.include?(victim_1)
    assert medusa.statues.include?(victim_4)
  end
end
