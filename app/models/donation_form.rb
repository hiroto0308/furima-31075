class DonationForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :delivery_area_id, :city, :address, :buliding_name, :phone, :purchase_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :delivery_area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, delivery_area_id: delivery_area_id, city: city, address: address, buliding_name: buliding_name, phone: phone, purchase_id: purchase.id)
  end
end
