class Product < ApplicationRecord
  has_many :cart_items, inverse_of: :product

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_cart_items, on: :update

  private
    def update_cart_items
      UpdateCartItems.call(product: self)
    end
end
