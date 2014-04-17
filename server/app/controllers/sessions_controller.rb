class SessionsController < BaseController
  skip_before_filter :restrict_access
  skip_before_action :require_login, except: :destroy

  def new
  end

  def create
    if @user = login(params[:session][:email], params[:session][:password])
      remember_me!
      redirect_to :root
      # render :create, status: :created
    else
      render json: { error: "Login failed" }, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to :root
  end

end
