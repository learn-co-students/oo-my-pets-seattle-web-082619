require "pry"

class Owner
  
  attr_reader :name, :species

  @@all_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all_owners << self

  end

  def name
    @name
  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
  end

  def cats 
    Cat.all.select { |c| c.owner == self }
  end

  def buy_cat(kitty)
    cat = Cat.new(kitty, self)
  end

  def dogs
    Dog.all.select { |d| d.owner == self }
  end

  def buy_dog(doggie)
    dog = Dog.new(doggie, self)
  end

  def walk_dogs
    dogs.map { |d| d.mood = "happy" }
  end

  def feed_cats
    cats.map { |c| c.mood = "happy" }
  end

  def sell_pets
    (dogs + cats).map { |pet| pet.mood = "nervous" }
    (dogs + cats).map { |pet| pet.owner = nil }
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  def Owner.all 
    @@all_owners
  end

  def Owner.count
    @@all_owners.length
  end

  def Owner.reset_all
    @@all_owners = []
  end

end