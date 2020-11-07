class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivary_area
  belongs_to :delivary_day
  belongs_to :delivary_fee
  belongs_to :item_condition

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivary_area_id
    validates :delivary_day_id
    validates :delivary_fee_id
    validates :item_condition_id
  end

  with_options presence: true do
    validates :product
    validates :introduction
    validates :price
    validates :image
  end 
end
