require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test "not null" do
     pay = Payment.new
     assert_not pay.save, "Saved null!"
  end
end
