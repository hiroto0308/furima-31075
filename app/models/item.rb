class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_area
  belongs_to :delivery_days
  belongs_to :delivery_fee
  belongs_to :item_condition

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_area_id
    validates :delivery_days_id
    validates :delivery_fee_id
    validates :item_condition_id
  end

  with_options presence: true do
    validates :product
    validates :introduction
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
    validates :image
  end
end
