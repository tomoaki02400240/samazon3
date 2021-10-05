class UsersController < ApplicationController
  before_action :set_params
  before_action :authenticate_user!
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

  def update_password
    if passowrd_set?
      @user.update_password(user_params)
      flash[:notice] ="パスワードは正しく変更されました"
      redirect_to root_path and return
    else
      @user.errors.add(:password, "パスワードに不備があります")
      render "edit_password"
    end
  end

  def edit_password
    
  end

  def favorite
    @favorite = @user.likees(Product)
  end
    private

  def user_params
    params.permit(:name, :email, :phone, :address, :password, :password_confirmation, )
  end
  def set_params
    @user = current_user
  end

  def password_set?
    user_params[:password].present? && user_params[:password_confirmation].present? ? true : false
  end
end
