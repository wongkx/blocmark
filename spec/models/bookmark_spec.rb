require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:topic) {Topic.create!(title:'Cats')}
  let(:cat_bookmark) {Bookmark.create!(url: 'https://www.pinterest.com/explore/cats/', topic:topic)}
  
  it {is_expected.to belong_to(:topic)}
  
  describe "attribute" do
      it "has url attribute" do
          expect(cat_bookmark).to have_attributes(url: 'https://www.pinterest.com/explore/cats/')
      end
  end
end
