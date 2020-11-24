require "spec_helper"
require "review"
require "pry"

RSpec.describe Review do
  describe ".newest" do
    it 'returns reviews created within the past day'  do
      restaurant = FactoryBot.create(:restaurant)
      recent_review = FactoryBot.create(
        :review, 
        restaurant: restaurant,
        created_at: Date.current.beginning_of_day
      )
      _old_review = FactoryBot.create(
        :review, 
        restaurant: restaurant,
        created_at: Date.current.beginning_of_day - 2
      )

      result = Review.newest

      expect(result).to contain_exactly(recent_review)
    end
  end

  describe "#submit" do
    it "saves the review" do
      restaurant = FactoryBot.create(:restaurant)
      review = Review.new(body: "delicious", restaurant: restaurant)

      review.submit

      expect(Review.find(review.id)).to be_present
      
    end

    it "increments the restaurant review count" do
      restaurant = FactoryBot.create(:restaurant)
      review = Review.new(body: "delicious!", restaurant: restaurant)

      review.submit

      expect(restaurant.times_reviewed).to eq(1)
    end
  end
end
