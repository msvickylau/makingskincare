class CategoriesController < ApplicationController

  def index
    # @categories = Category.all.order("created_at DESC")
     @face_categories = Category.all.where(:part => 'face')
     @hair_categories = Category.all.where(:part => 'hair')
     @body_categories = Category.all.where(:part => 'body')
  end

  def show
    @Category = Category.find(params[:id])
  end

end
