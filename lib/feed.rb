require "restaurant"

class Feed
  def initialize(restaurants:)
    @restaurants = restaurants
  end

  def new_restaurants
    Restaurant.recently_added
  end

  def latest_reviews
    Review.newest
  end
end
