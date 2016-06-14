require 'spec_helper'

describe MicropostsController, :type => :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:micropost) { FactoryGirl.create(:micropost, user: user) }
  let(:log) {
    Logger.new(STDOUT).tap { |l| l.level = Logger::DEBUG }
  }

  before { sign_in user, no_capybara: true}

  describe 'deleting a post with Ajax' do
    it 'should decrement the Micropost count' do
      expect do
        xhr :delete, :destroy, id: micropost.id
      end.to change(Micropost, :count)
    end
  end
end