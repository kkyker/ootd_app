class StaticPagesController < ApplicationController
  before_filter :signed_in_user
  def contact
  end

  def help
  end

  def about
  end

  def signed_in_user
    unless signed_in?
      redirect_to signin_path, notice: "Please sign in." 
    end
  end

end
