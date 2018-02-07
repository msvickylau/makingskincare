class CategoriesController < ApplicationController

  def index
     @face_categories = Category.all.where(:part => 'face')
     @hair_categories = Category.all.where(:part => 'hair')
     @body_categories = Category.all.where(:part => 'body')
  end

  def show
    @category = Category.find(params[:id])
    @formula = @category.formulas.order("updated_at DESC")
  end

end
