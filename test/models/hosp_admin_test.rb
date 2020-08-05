require 'test_helper'

class HospAdminTest < ActiveSupport::TestCase
  test "the truth" do
      hosp = HospAdmin.new 
      assert_not hosp.save , "null Admin saved!"
  end
end
