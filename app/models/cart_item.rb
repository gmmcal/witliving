class CartItem < ApplicationRecord
  belongs_to :user, inverse_of: :cart_items
  belongs_to :product, inverse_of: :cart_items

  validates :user, presence: true
  validates :product, presence: true
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  def total
    product.price * quantity.to_f
  end

  def self.total(user)
    user.cart_items.inject(0) { |sum, ci| sum + ci.total }
  end
end
