require 'spec_helper'

RSpec.describe 'Micropost pages', type: :request do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe 'micropost creation' do
    before { visit root_path }

    describe 'with invalid information' do

      it 'should not create a micropost' do
        expect { click_button 'Post' }.not_to change(Micropost, :count)
      end

      describe 'error messages' do
        before { click_button 'Post' }
        it { should have_content('error') }
      end
    end

    describe 'with valid information' do
      before { fill_in 'micropost_content', with: 'Lorem ipsum' }
      it 'should create a micropost' do
        expect { click_button 'Post' }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe 'micropost destruction' do
    let!(:micropost) { FactoryGirl.create(:micropost, user: user) }

    describe 'as correct user' do
      before { visit user_path(user) }

      it 'should delete a micropost' do
        expect { click_link 'delete' }.to change(Micropost, :count).by(-1)
        #expect { first('.js-remove-micropost').click }.to change(Micropost, :count).by(-1)
      end

    end
  end
end