class ProfilesController < ApplicationController
  before_action :set_user

  def show; end

  def edit; end

  def update
    @user.update(user_params)

    binding.pry

    redirect_to profile_path
  end

  def destroy
    @user.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
