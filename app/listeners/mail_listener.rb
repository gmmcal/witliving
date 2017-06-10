class MailListener
  def cart_item_expired(cart_items, user)
    NotifyMailer.expired_items(cart_items, user).deliver_now
  end

  def cart_item_price_updated(cart_items, user)
    NotifyMailer.price_updated(cart_items, user).deliver_now
  end
end
