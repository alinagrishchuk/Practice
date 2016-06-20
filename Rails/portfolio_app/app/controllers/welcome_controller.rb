class WelcomeController < ApplicationController
  def index
    @posts = Post.order("created_at desc").limit(3)
    @projects = Project.order("created_at desc").limit(3)
  end
end
