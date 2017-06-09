class AddItemToCart
  include Interactor
  include Wisper::Publisher

  def call
    product = context.product
    user = context.user

    cart_item = user.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity += 1
    cart_item.price = product.try(:price)

    context.cart_item = cart_item

    if cart_item.save
      broadcast(:cart_item_created, cart_item: cart_item, user: user)
    else
      context.fail!(message: cart_item.errors.full_messages)
    end
  end
end
