class SessionsController < AdminController
  
  skip_before_action :require_login
  skip_before_action :require_admin

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