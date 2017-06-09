class RemoveItemFromCart
  include Interactor
  include Wisper::Publisher

  def call
    product = context.product
    user = context.user

    cart_item = user.cart_items.find_by(product: product)
    context.fail!(message: 'Item not found') if cart_item.nil?
    cart_item.quantity -= 1

    if cart_item.quantity.zero?
      cart_item.destroy
      broadcast(:cart_item_removed, cart_item: cart_item, user: user)
    elsif cart_item.save
      broadcast(:cart_item_removed, cart_item: cart_item, user: user)
    else
      context.fail!(message: cart_item.errors.full_messages)
    end
  end
end
