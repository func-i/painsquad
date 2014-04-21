class HomeController < ApplicationController
  skip_before_action :restrict_access

  def index
    @users = User.all
    @things = Thing.all
  end

end
