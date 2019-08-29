class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)

  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def cats
    Cat.all.select{ |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select{ |dog| dog.owner == self }
  end

  def walk_dogs
    self.dogs.map { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.map { |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.cats.map { |cat| cat.mood = "nervous" }
    self.dogs.map { |dog| dog.mood = "nervous" }
    self.cats.map { |cat| cat.owner = nil }
    self.dogs.map { |dog| dog.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end



end
