class Owner
  attr_reader :name, :species

  @@all = []
   

  def initialize(name,species="human")
    @name = name 
    @species = species
    @@all << self 
  end 

  def say_species 
    return "I am a human."
  end 

  def self.all 
    @@all
  end 

  def self.count 
    @@all.count
  end 

  def self.reset_all
    @@all.clear
  end

  def cats 
    collection_of_cats = []
    Cat.all.each do |cat|
      if cat.owner == self 
      collection_of_cats << cat
      end 
    end 
    return collection_of_cats
  end 
  
  #returns an array of all the cats that belong to the owner 
  #iterate through @@all for all the cats 
  #push them into an array 
  #each sandwich 
  def dogs
    collection_of_dogs = []
    Dog.all.each do |dog|
      if dog.owner == self
      collection_of_dogs << dog
      end 
    end 
    return collection_of_dogs
  end 

#above pattern is important, it is a sandwich pattern 
#that you will use often 

  def buy_cat(name)
    Cat.new(name,self)
  end 
#how does the method above know about its cats?
# this method would create a new cat instance, then you could 
#call owner.buy_cat("name") and it would produce the dogs name =) 
#thats how ;)  - Im almost positive 

  def buy_dog(name)
    Dog.new(name,self)
  end 
 

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end 
  end 
    #remember that a lot of our code builds on ourself.
    #we already have a method that created a collection of dogs. 
    #walking all of his dogs.

    def feed_cats
      self.cats.each do |cat|
        cat.mood = "happy"
      end 
    end 

    def sell_pets 
      self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
      end 
      self.cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil 
      end 
    end 

    def list_pets 
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end 
end
