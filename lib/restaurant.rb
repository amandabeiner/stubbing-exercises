require "review"
require "date"
require "pry"

class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  has_many :reviews

  def self.recently_added
    where("created_at >= ?", Date.current - 7)
  end

  def recent_reviews
    reviews.where("created_at >= ?", Date.current - 2)
  end

  def increment_review_count
    update(times_reviewed: times_reviewed + 1)
  end
end
