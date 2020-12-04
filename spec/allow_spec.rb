require "rspec"

class Restaurant
  attr_reader :name
  
  def initialize(name:)
    @name = name
  end
end

class RestaurantAlert
  def random_restaurant_message
    "Have you checked out #{Restaurant.random.name} recently?"
  end

  def random_restaurant
    Restaurant.random
  end
end

RSpec.describe RestaurantAlert do 
  describe "#random_restaurant_message" do
    it "returns message with a random restaurant name" do
      # write test for random_restaurant_message method
      # use allow to allow restaurant to receive random
      # return an instance double of restaurant
      # Assert on message with instance double name
    end
  end
end
