require 'rails_helper'

RSpec.describe Staff, type: :model do

  let(:staff) { create(:staff) }

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:disease) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should have_many(:appointments) }
  end

  context "after_save" do
    describe "#generate ref number" do
      it "should contain ref number" do
        expect(patient.ref_num).to include("REF")
      end
    end
  end

  context "helper_methods" do
    describe "#get_emergency_status" do

      before do
        patient.update(status: "Emergency")
      end

      it "should give true status if status is emergency" do
        expect(patient.admit_emergency).to be_truthy
      end
    end
  end
end
