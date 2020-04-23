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
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.find_all { |cat| cat.owner == self }
  end

  
  def dogs
    Dog.all.find_all do |dog|
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
    Dog.all.select { |dog| dog.owner == self }.map { |dog| dog.mood = "happy" }
  end

  def feed_cats
    Cat.all.select { |cat| cat.owner == self }.map { |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.cats.map { |cat| cat.mood = "nervous"}
    self.dogs.map { |dog| dog.mood = "nervous" }
    self.cats.map { |cat| cat.owner = nil }
    self.dogs.map { |dog| dog.owner = nil }
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
