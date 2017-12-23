require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.create!(email: 'blochead@bloc.io', password: 'blochead', password_confirmation: 'blochead') }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    
    describe "attributes" do
      it "should have email and password attribute" do
          expect(user).to have_attributes(:email => 'blochead@bloc.io', :password => 'blochead')
      end
  end
end
