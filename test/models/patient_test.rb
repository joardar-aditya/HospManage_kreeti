require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test "not patient null" do
     patient = Patient.new
     assert_not patient.save, "Saved null"
  end
end
