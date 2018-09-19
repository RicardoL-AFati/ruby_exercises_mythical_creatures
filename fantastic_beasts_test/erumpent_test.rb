gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/erumpent'
require_relative '../fantastic_beasts_lib/wizard'

class ErumpentTest < Minitest::Test
  def test_no_calfs_when_created
    erumpent = Erumpent.new(:M)

    assert_equal 0, erumpent.calfs
  end

  def test_not_exploded_when_created
    erumpent = Erumpent.new(:M)

    refute erumpent.exploded?
  end

  def test_kills_wizard_when_charged_at
    erumpent = Erumpent.new(:M)
    harry = Wizard.new("Harry")

    assert_equal :alive, harry.status?

    erumpent.charge_at(harry)
    assert_equal :dead, harry.status?
  end

  def test_explodes_another_erumpent_when_charged_at
    erumpent = Erumpent.new(:M)
    erumpent_2 = Erumpent.new(:M)

    refute erumpent.exploded?
    refute erumpent_2.exploded?

    erumpent.charge_at(erumpent_2)
    assert erumpent_2.exploded?
  end

  def test_wont_give_birth_if_male
    erumpent = Erumpent.new(:M)

    refute erumpent.female?
    assert_nil erumpent.give_birth
  end

  def test_wont_give_birth_if_exploded
    erumpent = Erumpent.new(:F)
    erumpent_2 = Erumpent.new(:F)

    assert erumpent.female?

    erumpent_2.charge_at(erumpent)
    assert erumpent.exploded?
    assert_nil erumpent.give_birth
  end

  def test_will_give_birth_if_female_and_not_exploded
    erumpent = Erumpent.new(:F)

    assert erumpent.female?
    refute erumpent.exploded?

    assert_equal 0, erumpent.calfs
    erumpent.give_birth
    assert_equal 1, erumpent.calfs
  end
end
