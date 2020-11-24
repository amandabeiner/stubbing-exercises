require "spec_helper"
require "feed"
require "date"

RSpec.describe Feed do
  describe "#new_restaurants" do
    it "returns the newest restaurants" do
      restaurant = FactoryBot.create(:restaurant)
      _old_restaurant = FactoryBot.create(:restaurant, created_at: Date.current - 10)
      feed = Feed.new(restaurants: Restaurant.all)

      results = feed.new_restaurants

      expect(results).to contain_exactly(restaurant)
    end
  end

  describe "#latest_reviews" do
    it "returns the most recent reviews" do
      review = FactoryBot.create(:review)
      _old_review = FactoryBot.create(:review, created_at: Date.current - 2)
      feed = Feed.new(restaurants: Restaurant.all)

      results = feed.latest_reviews

      expect(results).to contain_exactly(review)
    end
  end
end
