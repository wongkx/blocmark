require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:user) {User.create!(email:'blochead@bloc.io', password: 'password')}
  let(:my_topic) {Topic.create!(title:'My title', user:user )}
  
  it {is_expected.to belong_to(:user)}
  
  describe "attribute" do
      it "has title attribute" do
          expect(my_topic).to have_attributes(title: 'My title')
      end
  end
end
