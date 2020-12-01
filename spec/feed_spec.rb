require "spec_helper"
require "feed"
require "date"

RSpec.describe Feed do
  describe "#new_restaurants" do
    it "returns the newest restaurants" do
      restaurants = double("restaurants")
      allow(Restaurant).to receive(:recently_added).and_return(restaurants)
      feed = Feed.new(restaurants: restaurants)

      results = feed.new_restaurants

      expect(Restaurant).to have_received(:recently_added)
      expect(results).to eq(restaurants)
    end
  end

  describe "#latest_reviews" do
    it "returns the most recent reviews" do
      restaurants = double("restaurants")
      reviews = [instance_double(Review)]
      allow(Review).to receive(:newest).and_return(reviews)
      feed = Feed.new(restaurants: restaurants)

      results = feed.latest_reviews

      expect(Review).to have_received(:newest)
      expect(results).to eq(reviews)
    end
  end
end
