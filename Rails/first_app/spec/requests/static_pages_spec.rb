require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it "should have the content 'Sample App'" do
     should have_content('Sample App')
    end

    it "should have the base title" do
      should have_title(full_title(''))
    end

    it "should not have a custom page title" do
      should_not have_title('| Home')
    end

  end

  describe "Help page" do
    before { visit help_path }
    it "should have the content 'Help'" do
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      expect(page).to have_title(full_title("Help"))
    end
  end


  describe "About page" do
    before { visit  about_path }
    it "should have the content 'About us'" do
      expect(page).to have_content('About us')
    end

    it "should have the title 'About us'" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About us")
    end
  end

  describe "Contact page" do
    before { visit  contact_path }
    it "should have the content 'Contact'" do
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end
