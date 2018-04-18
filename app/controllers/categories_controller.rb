class CategoriesController < ApplicationController

  def index
     @face_categories = Category.all.where(:part => 'face')
     @hair_categories = Category.all.where(:part => 'hair')
     @body_categories = Category.all.where(:part => 'body')
  end

  def show
    @category = Category.find(params[:id])
    @formulas = @category.formulas.order("created_at DESC")

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @category }
    end
  end

end
