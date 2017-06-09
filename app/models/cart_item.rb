class CartItem < ApplicationRecord
  belongs_to :user, inverse_of: :cart_items
  belongs_to :product, inverse_of: :cart_items

  validates :user, presence: true
  validates :product, presence: true
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  scope :expired, -> { where('updated_at < ?', Time.now - 2.days)}

  def total
    product.price * quantity.to_f
  end

  def self.total(user)
    user.cart_items.inject(0) { |sum, ci| sum + ci.total }
  end

  def self.quantity(user)
    user.cart_items.inject(0) { |sum, ci| sum + ci.quantity }
  end

  def self.pending_quantity
    User.all.map{ |u| CartItem.quantity(u) }.sum
  end

  def self.pending_amount
    User.all.map{ |u| CartItem.total(u) }.sum
  end
end
