class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @number_of_formulas = @user.formulas.count
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

end
 