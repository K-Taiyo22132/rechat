class UsersController < ApplicationController
  before_action :require_login, only: [:show, :destroy, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    image_path = Rails.root.join("public/images/","rails.jpg")
    File.open(image_path,"r+b") do |f|
      @user.profile_image = f.read
    end
    if @user.save
      log_in(@user)
      redirect_to edit_user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(current_user.id)
    @follow = nil
    @follow_new = Follow.new
    @follow = Follow.find_by(followed_user_id: @user.id, user_id: current_user.id)
  end

  def profile
    @user = User.find(params[:user_id])
    @follow = nil
    render 'show'
    @follow_new = Follow.new
    @follow = Follow.find_by(followed_user_id: @user.id, user_id: current_user.id)
  end


  def destroy

    current_user.destroy
    redirect_to signup_path
  end

  def send_image
    user = User.find(params[:id])
    send_data(user.profile_image,disposition: :inline)
  end

  def edit
    
    
    @user = User.find(current_user.id)
    @user_edit = params[:user_edit]

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_attributes)
        redirect_to new_select_category_path(@select_category),notice: "User was successfully updated."
    else
      render 'edit'
    end
  end

  
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :occupation_id)
    end

    def follow_params
      params.require(:follow).permit(:followed_user_id)
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


