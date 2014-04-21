class SessionsController < ApplicationController
  skip_before_action :restrict_access
  skip_before_action :require_login, except: :destroy

  def new
  end

  def create
    respond_to do |format|
      if @user = login(params[:session][:email], params[:session][:password])
        remember_me!
        format.html { redirect_to(:root) }
        format.json { render :create, status: :created }
      else
        format.html { redirect_to(:root, error: "Login failed") }
        format.json { render error: "Login failed", status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to :root
  end

end
