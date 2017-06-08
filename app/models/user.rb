class User < ApplicationRecord
  has_many :cart_items, inverse_of: :user

  validates :name, presence: true
end
