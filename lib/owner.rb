require 'pry'


class Owner
  attr_reader :name, :species 
  attr_accessor 

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all.clear
  end 

  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
  end 
  
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.select do |dog|
      dog.mood = "happy"
    end 
  end

  def feed_cats
    self.cats.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.select do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end 
    self.dogs.select do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end