gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../fantastic_beasts_lib/billywig'
require_relative '../fantastic_beasts_lib/wizard'

class BillywigTest < Minitest::Test
  def test_is_created_with_color
    billywig = BillyWig.new

    assert_equal "vivid sapphire blue", billywig.color
  end

  def test_is_native_to_outback
    billywig = BillyWig.new

    assert_equal "Australia", billywig.native_to
  end

  def test_it_stings_a_wizard_and_changes_mood
    billywig = BillyWig.new
    harry = Wizard.new("Harry")

    assert_equal "normal", harry.mood

    billywig.sting(harry)
    assert_equal "giddy", harry.mood
  end
end
