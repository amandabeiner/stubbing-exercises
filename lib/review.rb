require 'date'
require 'restaurant'
require 'pry'

class Review < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :restaurant

  def self.newest
    where("reviews.created_at >= ? ", Date.current.beginning_of_day - 1)
  end

  def submit
    if save!
      restaurant.increment_review_count
    end
  end
end
