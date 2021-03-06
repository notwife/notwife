# -*- coding: utf-8 -*-

class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])

    unless @user == current_user
      redirect_to root_path
      return
    end

    @user.notifo_username = params[:user][:notifo_username]
    if @user.save
      if @user.notifo_username
        $notifo.subscribe_user(@user.notifo_username)
      end

      redirect_to dashboard_path
    end
  end

  def sample
    @user = User.find(params[:id])

    unless @user == current_user
      redirect_to root_path
      return
    end

    title = "information"
    text  = "Success!"
    $notifo.post(@user.notifo_username, text, title)

    parameters = {
      :twitter_id          => @user.twitter_id,
      :notifo_username     => @user.notifo_username,
      :twitter_screen_name => @user.twitter_screen_name }
    $husband.post(parameters)

    redirect_to dashboard_path
  end
end
