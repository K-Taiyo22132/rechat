class UsersController < ApplicationController
  before_action :require_login, only: [:show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    image_path = Rails.root.join("public/images/","rails.png")
    File.open(image_path,"r+b") do |f|
      @user.profile_image = f.read
    end
    if @user.save
      log_in(@user)
      redirect_to profile_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def destroy
    current_user.destroy
    redirect_to signup_path
  end
  
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :occupation_id)
    end
  end


