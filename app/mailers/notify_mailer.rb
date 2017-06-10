class NotifyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify_mailer.expired_items.subject
  #
  def expired_items(items, user)
    @items = items
    @user = user

    mail to: "to@example.org"
  end

  def price_updated(items, user)
    @items = items
    @user = user

    mail to: "to@example.org"
  end
end
