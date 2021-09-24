class UsersController < ApplicationController
  before_action :set_params
  def edit
    #set_params
  end

  def update
    #set_params
    #debugger
    @user.update_without_password(user_params)
    
    redirect_to mypage_users_url
  end

  def mypage
    #set_params
  end

  def edit_address
    #set_params
  end
  private

  def user_params
    params.permit(:name, :email, :phone, :address, :password, :password_confirmation, )
  end
  def set_params
    @user = current_user
  end
end
