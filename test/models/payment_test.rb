require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test "not null" do
     pay = Payment.new
     assert_not pay.save, "Saved Payment null!"
  end
end
