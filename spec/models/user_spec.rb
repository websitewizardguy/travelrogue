require "rails_helper"

describe User do
  describe "#passenger?" do
    let(:user) { create(:user) }
    let(:ride) { create(:ride) }

    context "when user is a passenger" do
      let!(:passenger) do
        create(:passenger, user_id: user.id, ride_id: ride.id)
      end

      it "should return true" do
        expect(user.passenger?(ride)).to be_truthy
      end
    end

    context "when user is NOT a passenger" do
      it "should return false" do
        expect(user.passenger?(ride)).to be_falsy
      end
    end
  end
end
