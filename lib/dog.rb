class Dog
  attr_reader :name, :age, :breed, :walks
  attr_accessor :small_breed

  def initialize(name, age, breed, small_breed, walks = 0)
    @name = name
    @age = age
    @breed = breed
    @small_breed = small_breed
    @walks = 0
  end

  def bark
    if @small_breed == false
      return "ROOF"
    else @small_breed == true
      return "Yap!"
    end
  end

  def walk
    @walks += 1
  end
end
