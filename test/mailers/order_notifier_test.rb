require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(morders(:one))
    assert_equal "Received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(morders(:one))
    assert_equal "Shipped", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

end
