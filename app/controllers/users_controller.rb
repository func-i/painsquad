class UsersController < BaseController
  skip_before_filter :restrict_access, only: [:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      auto_login @user
      redirect_to root_path
      # respond_with @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      head :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def password
    @user = User.find(params[:id])
    if @user.update_attributes(password: params[:password])
      head :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    head :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
