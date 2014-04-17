class SessionsController < BaseController
  skip_before_filter :restrict_access

  def create
    if @user = login(params[:session][:email], params[:session][:password])
      remember_me!
      render :create, status: :created
    else
      render json: { error: "Login failed" }, status: :unprocessable_entity
    end
  end

  def destroy
    logout
  end

end
