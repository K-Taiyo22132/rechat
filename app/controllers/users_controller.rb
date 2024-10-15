class UsersController < ApplicationController
  before_action :require_login, only: [:show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to edit_user_path(@user)
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

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_attributes)
      redirect_to profile_path(@user),notice: "User was successfully updated."
    else
      render 'edit'
    end
  end

  
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :occupation_id)
    end


    def user_params_update
      params.require(:user).permit(:name, :profile_image)
    end

    def user_update_attributes
      if user_params_update[:profile_image] == nil
      {
        name: user_params_update[:name]
      }
      else
      {
        name: user_params_update[:name], profile_image: user_params_update[:profile_image].read
      }
      end
    end
  end


