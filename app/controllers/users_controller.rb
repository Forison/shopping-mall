class UsersController < ApplicationController
  def index 
    @user = User.all
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.account_activation(@user).deliver_now
      # flash[:info] = "Please check your email to activate your account."
      # log_in @user
      log_in @user
      flash[:success] = "welcome to our page"
      redirect_to root_path
    else
      flash[:danger] = "oops could sign up"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
