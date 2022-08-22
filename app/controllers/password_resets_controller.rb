class PasswordResetsController < ApplicationController
  before_action :set_token, only: %i[edit update]

  def new; end

  def create
    @user = User.find_by_email(params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path
  end

  def edit
    return not_authenticated if @user.blank?
  end

  def update
    return not_authenticated if @user.blank?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_token
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
  end
end
