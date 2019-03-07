require 'minitest/autorun'
require 'minitest/pride'
require './lib/dog'
require './lib/walker'

class WalkerTest < Minitest::Test

  def setup
    @shelby = Walker.new("Shelby", 5)
    @sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    @max = Dog.new("Max", 11, "Cocker Spaniel", false)
    @chloe = Dog.new("Chloe", 1, "Siberian Husky", false)
    @mousse = Dog.new("Mousse", 1, "Chesapeake Retriever", false)
    @elwood = Dog.new("Elwood", 16, "Cocker Spaniel", false)
  end

  def test_it_exists
    assert_instance_of Walker, @shelby
  end

  def test_it_has_attributes
    assert_equal "Shelby", @shelby.name
    assert_equal 5, @shelby.poop_bags
  end

  def test_walker_begins_without_clients
    assert_equal [], @shelby.clients
  end

  def test_it_adds_clients
    @shelby.add_client(@sodie)
    @shelby.add_client(@max)
    assert_equal [@sodie, @max], @shelby.clients
  end

  def test_it_adds_walks_for_clients_and_decrease_poop_bags
    @shelby.add_client(@sodie)
    @shelby.add_client(@max)
    @shelby.clients[0].walk
    @shelby.clients[0].walk
    assert_equal 2, @shelby.clients[0].walks
    assert_equal 4, @shelby.poo_patrol
  end

  def test_it_counts_number_of_clients
    @shelby.add_client(@sodie)
    @shelby.add_client(@max)
    assert_equal 2, @shelby.client_count
  end

  def test_it_lists_all_puppies
    @shelby.add_client(@sodie)
    @shelby.add_client(@chloe)
    @shelby.add_client(@mousse)
    assert_equal [@chloe, @mousse], @shelby.puppy_clients
  end

  def test_it_lists_all_older_dogs
    @shelby.add_client(@sodie)
    @shelby.add_client(@chloe)
    @shelby.add_client(@mousse)
    @shelby.add_client(@max)
    assert_equal [@sodie, @max], @shelby.older_clients
  end

  def test_it_can_list_client_names
    @shelby.add_client(@sodie)
    @shelby.add_client(@chloe)
    @shelby.add_client(@mousse)
    @shelby.add_client(@max)
    assert_equal ["Sodie", "Chloe", "Mousse", "Max"], @shelby.client_names
  end

  def test_it_lists_all_names_ending_with_y_or_ie
    @shelby.add_client(@sodie)
    @shelby.add_client(@chloe)
    @shelby.add_client(@mousse)
    @shelby.add_client(@max)
    assert_equal [@sodie], @shelby.ends_with_y_or_ie
  end

  def test_it_returns_a_certain_breed
    @shelby.add_client(@sodie)
    @shelby.add_client(@chloe)
    @shelby.add_client(@mousse)
    @shelby.add_client(@max)
    assert_equal [@chloe], @shelby.specific_breed("Siberian Husky")
  end

  def test_it_returns_list_of_client_by_breed
    @shelby.add_client(@sodie)
    @shelby.add_client(@chloe)
    @shelby.add_client(@mousse)
    @shelby.add_client(@max)
    @shelby.add_client(@elwood)
    expected = {"Shih-Tzu" => [@sodie], "Siberian Husky" => [@chloe], "Chesapeake Retriever" => [@mousse], "Cocker Spaniel" => [@max, @elwood]}
    assert_equal expected, @shelby.client_by_breed
  end
end

#
# - BONUS: Make a list of clients, organized by breed. This might look something like:
# ```
# breed_list =
#   { "Shih-Tzu": [oscar, sodie],
#     "Cocker Spaniel": [max]
#   }
# ```
# - BONUS: Make sure the walker can not accidentally add the same client more than once.
