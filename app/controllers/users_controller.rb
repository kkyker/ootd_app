class UsersController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :show]
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to Outfit of the Day!"
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  def index
  	@Users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :image, :password_confirmation)
  end

  def signed_in_user
    unless signed_in?
      redirect_to signin_path, notice: "Please sign in." 
    end
  end
end
