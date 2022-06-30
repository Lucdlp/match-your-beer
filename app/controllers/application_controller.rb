class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_address, :first_name, :surname, :age, :gender])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_address, :first_name, :surname, :age, :gender])
  end

  def after_sign_in_path_for(resource)
    if session[:tag] == "beer"
      @beer = Beer.find(session[:tag_id])
      beer_path(@beer)
    elsif session[:tag] == "recipe"
      @recipe = Recipe.find(session[:tag_id])
      recipe_path(@recipe)
    else
      super
    end
  end
end
