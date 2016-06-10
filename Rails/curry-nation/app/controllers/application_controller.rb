class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_sidebar_variables

  def set_sidebar_variables
    @food_preferences = FoodPreference.limit(10)
    @food_types = FoodType.limit(10)
    @cuisines = Cuisine.limit(10)
  end
end
