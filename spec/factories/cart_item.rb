FactoryGirl.define do
  factory :cart_item do
    quantity { Faker::Number.between(1, 10) }
    user
    product
  end
end
