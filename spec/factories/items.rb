FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    product { 'hoge' }
    introduction { Faker::Lorem.sentence }
    category_id { 2 }
    item_condition_id { 2 }
    price { 500 }
    delivery_fee_id { 2 }
    delivery_area_id { 2 }
    delivery_days_id { 2 }
    association :user
  end
end
