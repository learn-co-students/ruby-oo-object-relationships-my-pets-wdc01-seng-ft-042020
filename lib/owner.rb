require_relative './cat.rb'
require_relative './dog.rb'

class Owner
  # code goes here
  
  attr_reader :name, :species
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
      @@all.count
    end
    
    def self.reset_all
      self.all.clear
    end
    
    def cats
      Cat.all.select {|cat| cat.owner == self}
    end
    
    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end
    
    def buy_cat(name)
      Cat.new(name, self) 
    end
    
    def buy_dog(name)
      Dog.new(name, self) 
    end
    
    def walk_dogs
      dogs.each {|dog| dog.mood = "happy"}
    end
    
    def feed_cats
      cats.map {|cat| cat.mood = "happy"}
    end
    
    def sell_pets
      owner_pets = cats + dogs
      owner_pets.each do |pet| 
        pet.mood = "nervous"
        pet.owner = nil
      end
    end

    def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end
end


