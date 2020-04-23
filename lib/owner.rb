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
    

  end


end


