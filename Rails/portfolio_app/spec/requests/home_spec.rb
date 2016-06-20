require 'rails_helper'

RSpec.describe "Home page", type: :request do
  subject { page }

  let!(:post1) { create(:post) }
  let!(:post2) { create(:post) }
  let!(:post3) { create(:post) }
  let!(:post4) { create(:post) }

  let!(:project1) { create(:project) }
  let!(:project2) { create(:project) }
  let!(:project3) { create(:project) }
  let!(:project4) { create(:project) }

  before do
    visit root_path
  end

  it "should have 3 last post" do
    expect(page).to have_selector(".col-2 h3", text: post4.title )
    expect(page).not_to have_selector(".col-2 h3", text: post1.title )
  end

  it "should have 3 last project" do
    expect(page).to have_selector(".col-3 h3", text: project4.title )
    expect(page).not_to have_selector(".col-3 h3", text: project1.title )
  end

  it "should have the right links on the layout" do
    click_link "Posts"
    expect(page).to have_selector("h1#page_title", text: "Stuff I've Written")

    click_link "Projects"
    expect(page).to have_selector("h1#page_title", text: "Stuff I've build")

    click_link "Contacts"
    expect(page).to have_selector("h1#page_title", text: "Say hello!")
  end

end
