class UsersController < ApplicationController

  def index
     redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
  end

end
