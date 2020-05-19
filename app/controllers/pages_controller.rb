class PagesController < ApplicationController

  helper_method :current_user, :logged_in?

  def home
    redirect_to articles_path if logged_in?
  end

  def logged_in
    !!current_user
  end

  def about
  end
end
