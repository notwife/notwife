class SessionsController < ApplicationController
  def create
    render :text => "Hello, #{request.env['rack.auth']['user_info']['nickname']}"
  end
end
