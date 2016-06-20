require 'rails_helper'

RSpec.describe "AuthenticationPages", type: :request do
  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button 'Log in' }
      it { should have_content('Log in') }
    end

    describe 'with valid information' do
      let(:user) { create(:user) }
      before { sign_in(user) }
      it { should have_link('Log out', href: destroy_user_session_path) }
      it { should_not have_link('Log in', href: new_user_session_path) }
    end

    describe "authorization" do
      let(:user) { FactoryGirl.create(:user) }

      describe "for non-signed in users" do
        it { should have_link('Log in') }

        describe "when attempting to visit a protected page" do
          describe "in the Posts controller" do
            let(:post_item) { create(:post) }

            describe "haven't link to modify&destroy post" do
              before { visit post_path(post_item) }
              it { should_not have_link("Edit Article", href: edit_post_path(post_item)) }
              it { should_not have_link("Delete Article", href: post_path(post_item)) }
            end

            describe 'submitting to the create action' do
              before { post posts_path }
              specify { expect(response).to redirect_to(new_user_session_path) }
            end

            describe "submiting to the destroy action" do
              before { delete post_path(create(:post)) }
              specify { expect(response).to redirect_to(new_user_session_path) }
            end
          end

          describe "in the Project controller" do
            let(:project_item) { create(:project) }

            describe "haven't link to modify&destroy project" do
              before { visit project_path(project_item) }
              it { should_not have_link("Edit project", href: edit_project_path(project_item)) }
              it { should_not have_link("Delete project", href: project_path(project_item)) }
            end

            describe 'submitting to the create action' do
              before { post projects_path }
              specify { expect(response).to redirect_to(new_user_session_path) }
            end

            describe "submiting to the destroy action" do
              before { delete project_path(create(:project)) }
              specify { expect(response).to redirect_to(new_user_session_path) }
            end
          end

        end
      end

      describe "for signed in users" do
        before { sign_in(create(:user)) }

        describe "in the Posts controller" do
          let(:post_item) { create(:post) }
          describe "have link to modify&destroy post" do
            before { visit post_path(post_item) }
            it { should have_link("Edit Article", href: edit_post_path(post_item)) }
            it { should have_link("Delete Article", href: post_path(post_item)) }
          end
        end

        describe "in the Project controller" do
          let(:project_item) { create(:project) }

          describe "haven link to modify&destroy project" do
            before { visit project_path(project_item) }
            it { should have_link("Edit project", href: edit_project_path(project_item)) }
            it { should have_link("Delete project", href: project_path(project_item)) }
          end
        end
      end
    end

  end


end
