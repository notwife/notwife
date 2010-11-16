class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user

    @user.notifo_username = params[:user][:notifo_username]
    if @user.save
      redirect_to dashboard_path
    end
  end
end
