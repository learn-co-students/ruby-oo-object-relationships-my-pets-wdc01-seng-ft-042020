require 'pry'

require_relative "./cat.rb"
require_relative "./dog.rb"


class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
    #binding.pry
    Owner.count
  end

  def cats #returns a collection of all the cats that belong to the owner
      Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
      Dog.all.select {|dog| dog.owner == self}
  end


end

#  mert = Owner.new("Mert")
# ella = Dog.new("Ella", mert)
# lady = Dog.new("Lady", mert)
# davis = Owner.new("Davis")
# tabby = Dog.new("Tabby", davis)
#
# print mert.dogs

# Owner.reset_all
