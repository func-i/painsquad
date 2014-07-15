class SessionsController < ApplicationController
  skip_before_action :restrict_access
  skip_before_action :require_login

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to :admin
    else
      flash.now[:alert] = 'Email or password was invalid'
      render :new
    end
  end

  def destroy
    logout
    redirect_to :login, :notice => 'Logged out!'
  end

end