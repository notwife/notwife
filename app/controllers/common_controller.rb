class CommonController < ApplicationController
  def top
    @title = "Notwife is not your wife."
    @user  = current_user
  end

  def dashboard
    @title = "Dashboard - Notwife"
    unless signed_in?
      redirect_to :action => 'top'
    end

    @user = current_user
  end

  def information
    @title = "Information - Notwife"

    @user = current_user
  end
end
