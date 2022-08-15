class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    return not_authenticated if @user.blank?

    # githubや基礎編通りの@user.password_confirmationだとno method errorが出てしまうので、 @user.crypted_passwordにしています。
    @user.crypted_password = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path
    else
      render :edit
    end
  end
end
