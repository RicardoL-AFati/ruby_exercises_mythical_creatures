gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/dragon'
require_relative '../fantastic_beasts_lib/wizard'

class DragonTest < Minitest::Test
  def test_is_created_with_a_breed
    norbet = Dragon.new("Norwegian Ridgeback", :M)

    assert_equal "Norwegian Ridgeback", norbet.breed
  end

  def test_is_hungry_when_created
    dragon = Dragon.new("Peruvian Vipertooth", :F)

    assert dragon.hungry?
  end

  def test_not_in_flight_when_created
    dragon = Dragon.new("Hungarian Horntail", :F)

    refute dragon.in_flight
  end

  def test_has_no_eggs_when_created
    dragon = Dragon.new("Hebridean Black", :F)

    assert_equal 0, dragon.eggs
  end

  def test_has_not_eaten_a_wizard_when_created
    dragon = Dragon.new("Hebridean Black", :F)

    assert dragon.wizards_eaten.empty?
  end

  def test_does_not_lay_eggs_if_male
    dragon = Dragon.new("Common Welsh Green", :M)

    assert_nil dragon.lay_eggs
  end

  def test_lays_eggs_if_female
    dragon = Dragon.new("Antipodean Opaleye", :F)

    assert_equal 0, dragon.eggs
    dragon.lay_eggs

    assert_equal 5, dragon.eggs
  end

  def test_can_eat_a_wizard_and_kill_wizard
    dragon = Dragon.new("Swedish Short-Snout", :M)
    cedric = Wizard.new("Cedric")

    assert_equal :alive, cedric.status?

    dragon.eat_wizard(cedric)
    assert_equal :dead, cedric.status?
  end

  def test_no_longer_hungry_after_eating_wizard
    dragon = Dragon.new("Chinese Fireball", :M)
    krum = Wizard.new("Krum")

    assert dragon.hungry?

    dragon.eat_wizard(krum)
    refute dragon.hungry?
  end

  def test_dragon_keeps_track_of_wizards_eaten
    dragon = Dragon.new("Romanian Longhorn", :M)
    harry = Wizard.new("Harry")
    ron = Wizard.new("Ron")
    hermonie = Wizard.new("Hermonie")

    assert dragon.wizards_eaten.empty?

    dragon.eat_wizard(harry)
    assert_equal 1, dragon.how_many_wizards_eaten?
    dragon.eat_wizard(ron)
    assert_equal 2, dragon.how_many_wizards_eaten?
    dragon.eat_wizard(hermonie)
    assert_equal 3, dragon.how_many_wizards_eaten?
  end

  def test_can_eat_other_things_and_not_be_hungry
    dragon = Dragon.new("Ukranian Ironbelly", :M)

    assert dragon.hungry?

    dragon.eat
    refute dragon.hungry?
  end


  def test_can_fly_and_be_in_flight
    dragon = Dragon.new("Hungarian Horntail", :M)

    refute dragon.in_flight?

    dragon.fly
    assert dragon.in_flight?
  end

  def test_can_land_after_taking_flight
    dragon = Dragon.new("Hungarian Horntail", :M)

    refute dragon.in_flight?

    dragon.fly
    assert dragon.in_flight?
    dragon.land
    refute dragon.in_flight?
  end
end
