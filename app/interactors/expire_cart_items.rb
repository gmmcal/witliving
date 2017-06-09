# This class would be triggered on a daily worker to expire cart items with more than 2 days
class ExpireCartItems
  include Interactor
  include Wisper::Publisher

  def call
    CartItem.expired.group_by{ |ci| ci.user_id}.each do |user_id, cart_items|
      user = User.find(user_id)
      cart_items.map(&:destroy!)
      broadcast(:cart_item_expired, cart_items, user)
    end
  end
end
