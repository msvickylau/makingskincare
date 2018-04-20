class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @number_of_formulas = @user.formulas.count

    respond_to do |format|
      format.html { render :show }
      format.json { render json:  @user }
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

end
 