require 'minitest/autorun'
require 'minitest/pride'
require './lib/dog'

class DogTest < Minitest::Test

  def setup
    @sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    @max = Dog.new("Max", 11, "Cocker Spaniel", false)
  end

  def test_it_exists
    assert_instance_of Dog, @sodie
  end

  def test_it_has_attributes
    assert_equal "Sodie", @sodie.name
    assert_equal 9, @sodie.age
    assert_equal "Shih-Tzu", @sodie.breed
    assert_equal true, @sodie.small_breed
    assert_equal "Max", @max.name
    assert_equal 11, @max.age
    assert_equal "Cocker Spaniel", @max.breed
    assert_equal false, @max.small_breed
  end

  def test_it_shows_one_dog_has_not_taken_a_walk
    assert_equal 0, @sodie.walks
  end

  def test_it_returns_one_dogs_bark
    assert_equal "Yap!", @sodie.bark
  end

  def test_it_returns_bigger_breeds_bark
    assert_equal "ROOF", @max.bark
  end

  def test_it_shows_one_dog_has_taken_walks
    @sodie.walk
    @sodie.walk
    assert_equal 2, @sodie.walks
  end
end
