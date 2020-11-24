require "spec_helper"
require "restaurant"
require "date"

RSpec.describe Restaurant do
  describe ".recently_added" do
    it "returns restaurants created this week" do
      today = FactoryBot.create(:restaurant, created_at: Time.now)
      yesterday = FactoryBot.create(:restaurant, created_at: Date.current - 1)
      _last_week = FactoryBot.create(:restaurant, created_at: Date.current - 10)
      
      results = Restaurant.recently_added

      expect(results).to contain_exactly(today, yesterday)
    end
  end

  describe "#recent_reviews" do
    it "returns the restaurant's reviews from the past two days" do
      review1 = FactoryBot.create(:review, created_at: Date.today)
      review2 = FactoryBot.create(:review, created_at: Date.current - 5)
      restaurant = FactoryBot.create(
        :restaurant_with_reviews,
        reviews: [review1, review2]
      )

      results = restaurant.recent_reviews

      expect(results).to contain_exactly(review1)
    end
  end

  describe "#increment_review_count" do
    it "adds one to the review count" do 
      restaurant = FactoryBot.create(:restaurant)

      restaurant.increment_review_count

      expect(restaurant.times_reviewed).to eq(1)
    end
  end
end
