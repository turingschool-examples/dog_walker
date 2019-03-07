class Walker
  attr_reader :name, :poop_bags, :clients

  def initialize(name, poop_bags)
    @name = name
    @poop_bags = poop_bags
    @clients = []
  end

  def add_client(dog)
    @clients << dog
  end

  def poo_patrol
    @poop_bags -= 1
  end

  def client_count #no instance variables allowed!
    @clients.count
  end

  def puppy_clients
    @clients.find_all do |client|
      client.age < 2
    end
  end

  def older_clients
    @clients.find_all do |client|
      client.age > 2
    end
  end

  def client_names
    @clients.map do |client|
      client.name
    end
  end

  def ends_with_y_or_ie
    @clients.find_all do |client|
      client.name.end_with?("ie")
    end
  end

  def specific_breed(breed)
    @clients.find_all do |client|
      client.breed == breed
    end
  end

  def client_by_breed
    @clients.group_by do |client|
      client.breed
    end
  end
end
# require 'pry'; binding.pry
