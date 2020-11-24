require "rspec"
require "active_record"
require "database_cleaner"
require "factory_bot"
require "timecop"

PROJECT_ROOT = File.expand_path("../..", __FILE__)
$LOAD_PATH << PROJECT_ROOT

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: File.join(PROJECT_ROOT, "test.db")
)

class CreateSchema < ActiveRecord::Migration[4.2]
  def self.up
    create_table :restaurants, force: true do |table|
      table.string :name, null: false
      table.integer :times_reviewed, null: false, default: 0

      table.timestamps
    end

    create_table :reviews, force: true do |table|
      table.text :body, null: false

      table.belongs_to :restaurant

      table.timestamps
    end
  end
end

FactoryBot.define do 
  sequence(:name) { |n| "restaurant#{n}" }
  sequence(:body) { |n| "review body#{n}" }

  factory :restaurant do
    name { "Stella's" }
    created_at { Time.now.beginning_of_day }
    times_reviewed { 0 }

    factory :restaurant_with_reviews do 
      reviews { [association(:review)] }
    end
  end

  factory :review do
    body { "Delicious! "}
    restaurant 
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    CreateSchema.suppress_messages { CreateSchema.migrate(:up) }
    DatabaseCleaner.clean_with :deletion
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do 
    DatabaseCleaner.clean
  end
end
