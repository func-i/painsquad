class HomeController < ApplicationController

  def index
    @users = User.all
    @things = Thing.all
  end

end
