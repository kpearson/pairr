require 'rails_helper'

describe User do
  describe "Validations" do

    context "on an existing user" do
      let(:user) { create :user }

      it "should be valid with no changes" do
        expect(user).to be_valid
      end

      it "should not be valid with an empty uid" do
        user.uid = ""
        expect(user).not_to be_valid
      end

      it "should not be valid with out a provider" do
        user.provider = ""
        expect(user).not_to be_valid
      end
    end

  end
end
