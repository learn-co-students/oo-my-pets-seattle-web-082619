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

  #Cat.all was able to get some but not all 




end
