class PasswordResetsController < ApplicationController
  before_action :set_token, only: %i[edit update]
  
  def new; end

  def create
    @user = User.find_by_email(params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path
  end

  def edit
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      not_authenticated
      return
    end
  end

  def update
    @user = User.load_from_reset_password_token(params[:id])

    return not_authenticated if @user.blank?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path
    else
      render :edit
    end
  end

  private

  def set_token
    @token = params[:id]
  end
end
