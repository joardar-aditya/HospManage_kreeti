require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  test "not staff null" do
    staff = Staff.new
    assert_not staff.save, "Saved null!"
 end
end
