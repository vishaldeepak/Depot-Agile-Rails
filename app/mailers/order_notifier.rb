class OrderNotifier < ApplicationMailer
  default from: "team@depot.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(morder)
    @morder = morder

    mail to: morder.email, subject: "Pragmatic Store Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @morder = morder

    mail to: morder.email, subject: "Pragmatic Store Order Shipped"
  end
end
