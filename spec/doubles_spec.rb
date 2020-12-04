require "rspec"

class Restaurant
  def self.new_this_week
  end
end

class RestaurantAlert
  def initialize(restaurant:)
    @restaurant = restaurant
  end
  
  def new_restaurant_message
    "New in your area: #{@restaurant.name}"
  end

  def weekly_round_up
    "Your weekly roundup of new restaurants: #{new_restaurants}"
  end
  
  def new_restaurants 
    Restaurant.new_this_week.map {|r| r.name}.join(", ")
  end
end

RSpec.describe RestaurantAlert do 
  describe "#new_restaurant_message" do
    it "returns a message string with the restaurant name" do
      # Write tests using doubles
      #   1. Test fails because `name` doesn't exist on double
      #   2. Give double a `name`. Test passes
      #   3. Update to instance_double. Test fails because no `name` on class
      #   4. Implement name on Restaraunt class. Test passes
    end
  end
end
