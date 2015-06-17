require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(morders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["team@depot.com"], mail.from
    #assert_match "Hi", mail.body.encoded #Later
  end

  test "shipped" do
    mail = OrderNotifier.shipped(morders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["team@depot.com"], mail.from
    #assert_match "Hi", mail.body.encoded #later
  end

end
