require 'test_helper'

class BedTest < ActiveSupport::TestCase
  test "not bed null" do
    bed = Bed.new
    assert_not bed.save, "Saved null!"
 end
end
