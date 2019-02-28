# Dog Walker

## Setup
* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Include the link to your forked repo in your pre-work gist!


# Activity

## Iteration 1

Complete Iteration 1 using the following interaction pattern, using TDD:

```ruby
pry(main)> require './lib/dog'
#=> true

pry(main)> sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
#=> #<Dog:0x007fe18483fcd0 @name="Sodie", @age=9, @breed="Shih-Tzu", @small_breed=true, @walks=0>

pry(main)> max = Dog.new("Max", 11, "Cocker Spaniel", false)
#=> #<Dog:0x007ff37e818318 @name="Max", @age=11, @breed="Cocker Spaniel", @small_breed=false, @walks=0>

pry(main)> sodie.name
#=> "Sodie"

pry(main)> sodie.age
#=> 9

pry(main)> sodie.breed
#=> "Shih-Tzu"

pry(main)> sodie.small_breed
#=> true

pry(main)> sodie.walks
#=> 0

pry(main)> sodie.bark
#=> "Yap!"

pry(main)> max.bark
#=> "ROOF"

pry(main)> sodie.walk

pry(main)> sodie.walks
#=> 1

pry(main)> sodie.walk

pry(main)> sodie.walks
#=> 2
```

## Iteration 2

Using TDD, create a Walker class that meets the following requirements:
- Has a name, number of poop bags to start with, and a way to read that data
- Has a list of clients (starting empty)
- Has a way to add clients (dog objects)
- Can walk a dog, which increases that dogs walks and decreases the poop bags the walker has
- Can count the number of clients (no instance variables allowed!)
- Can list all puppy clients
- Can list all elderly clients
- Can list all client names
- Can list all client names ending in "y" or "ie"
- Can check client list for a specific breed

- BONUS: Make a list of clients, organized by breed. This might look something like:
```
breed_list =
  { "Shih-Tzu": [oscar, sodie],
    "Cocker Spaniel": [max]
  }
```
- BONUS: Make sure the walker can not accidentally add the same client more than once.
