require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "populates an array of posts" do
      post = create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end
    it "renders the :index view"  do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show using friendly id" do
    let!(:post) { create(:post) }
    it "assigns the requested contact to @post" do
      get :show, id: post.slug
      expect(assigns(:post)).to eq(post)
    end

    it "renders the #show view using friendly id" do
      get :show, id:  post.slug
      expect(response).to render_template :show
    end

  end

end
