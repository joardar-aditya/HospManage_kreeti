require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  test "not staff null" do
    staff = Staff.new
    assert_not staff.save, "Saved Staff null!"
 end

  test "staff passing test" do 
     staff = Staff.create(name:"abcd",email: "abc@abc.com",  password: "xycdefghijkl", password_confirmation: "xycdefghijkl", access: true, doctor: true)
     assert staff.save, "Staff not updating"
  end 

  test "staff password strength" do 
    staff = Staff.create(name: "abcd", password: "xy", password_confirmation: "xy", email: "abc@abc.com", access: true, doctor: true)
    assert_not staff.save, "Staff saved with weak password"
  end
end
