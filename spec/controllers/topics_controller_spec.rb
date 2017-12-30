require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:my_topic) { Topic.create!(title: 'My Test Title') }
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it 'assigns [my_topic] to @topics' do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: my_topic.id}
      expect(response).to render_template(:show)
    end
    
    it "assigns my_topic to @topic" do
      get :show, {id: my_topic.id}
      expect(assigns(:topic)).to eq(my_topic)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end
    
    it "returns http redirect" do
      get :edit, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the edit view" do
      get :edit, {id: my_topic.id}
      expect(response).to render_template :edit
    end
  end

end
