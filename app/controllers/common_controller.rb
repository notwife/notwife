class CommonController < ApplicationController
  def top
    @title = "Notwife is not your wife."
  end

  def dashboard
    @title = "Dashboard - Notwife"
    unless signed_in?
      redirect_to :action => 'top'
    end
  end

  def about
    @title = 'About - Notwife'
  end

  def information
    @title = "Information - Notwife"
  end
end
