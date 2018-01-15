require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:my_topic) { Topic.create!(title: 'Foo') }
  let(:my_bookmark) { Bookmark.create!(url: 'www.foo.com', topic: my_topic) }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to render_template(:show)
    end
    
    it "assigns my_post to @post" do
      get :show, topic_id: my_topic.id, id: my_bookmark.id
      expect(assigns(:bookmark)).to eq(my_bookmark)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http redirect" do
      get :edit, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to render_template :edit
    end
    
    it "assigns bookmark to the updated @bookmark" do
      get :edit, topic_id:my_topic.id, id: my_bookmark.id
      
      bookmark_instance = assigns(:bookmark)
      
      expect(bookmark_instance.id).to eq my_bookmark.id
      expect(bookmark_instance.url).to eq my_bookmark.url
    end
  end
  
  describe "PUT update" do
    it "updates bookmark with expected attributes" do
      new_url = 'www.baz.com'
      
      put :update, topic_id: my_topic.id, id: my_bookmark.id, bookmark: { url: new_url }
      
      updated_bookmark = assigns(:bookmark)
      expect(updated_bookmark.id).to eq my_bookmark.id
      expect(updated_bookmark.url).to eq new_url
    end
  end
    
  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, topic_id: my_topic.id, id: my_bookmark.id
      
      count = Bookmark.where({id: my_bookmark.id}).size
      expect(count).to eq 0
    end
      
    it "returns http redirect" do
      delete :destroy, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
