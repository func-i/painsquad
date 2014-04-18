class HomeController < BaseController

  def index
    @users = User.all
    @things = Thing.all
  end

end
