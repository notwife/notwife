# -*- coding: utf-8 -*-

class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user

    @user.notifo_username = params[:user][:notifo_username]
    if @user.save
      if @user.notifo_username
        $notifo.subscribe_user(@user.notifo_username)
      end

      $husband.post({
                      :twitter_id          => @user.twitter_id,
                      :notifo_username     => @user.notifo_username,
                      :twitter_screen_name => @user.twitter_screen_name
                    })

      redirect_to dashboard_path
    end
  end

  def sample
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user

    title = "どうも、Notwifeです！"
    text  = "このメッセージが届いていたら、設定は成功しています！"
    $notifo.post(@user.notifo_username, text, title)

    redirect_to dashboard_path
  end
end
