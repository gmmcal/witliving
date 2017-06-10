class UpdateCartItems
  include Interactor
  include Wisper::Publisher

  def call
    product = context.product
    CartItem.where(product: product).where.not(price: product.price).group_by{ |ci| ci.user_id}.each do |user_id, cart_items|
      user = User.find(user_id)
      cart_items.each { |ci| ci.update(price: product.price) }
      broadcast(:cart_item_price_updated, cart_items, user)
    end
  end
end
