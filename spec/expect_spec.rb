require "rspec"

class Restaurant
  attr_reader :name
  
  def initialize(name:)
    @name = name
  end
end

class Notifier
  def send_notification(message)
  end
end

class RestaurantAlert
  def initialize(restaurant:, notifier:)
    @restaurant = restaurant
    @notifier = notifier
  end

  def send_alert
    @notifier.send_notification(new_restaurant_message)

  end

  def new_restaurant_message
    "New in your area: #{@restaurant.name}"
  end
end

RSpec.describe RestaurantAlert do
  describe "#send_alert" do 
    it "triggers alert send" do
      # write test for send_alert method
      # allow notifier instance to respond to send_notification
      # expect notifier to have send_notification called with correct message
      # Refactor to pass in Notifier class and use class_double
    end
  end
end








