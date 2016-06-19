require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "works! (now write some real specs)" do
      get categories_path
      expect(response).to have_http_status(200)
    end

    it "displays tasks" do
      Category.create!(name: 'sample name')
      get categories_path
      response.body.should include('sample name')
    end

    it "displays tasks v2" do
      Category.create!(name: 'sample name')
      visit categories_path
      page.should have_content('sample name')
    end
  end

  describe "POST /categories" do
    it "create category" do
      post_via_redirect categories_path, category: {name: 'sample name'}
      response.body.should include('sample name')
    end

    it "create category v2" do
      visit categories_path
      click_link "New Category"
      fill_in "category_name", with: 'sample name'
      save_and_open_page
      click_button "Create Category"
      page.should have_content('sample name')
    end
  end
end
