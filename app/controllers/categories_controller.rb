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

  def next_category  # get '/categories/:id/next', to: 'categories#next_category'
    @category = Category.find(params[:id])
    @next_category = @category.next
    render json: @next_category
  end

  def previous_category #get '/categories/:id/previous', to: 'categories#previous_category'
    @category = Category.find(params[:id])
    @previous_category = @category.previous
    render json: @previous_category
  end

end
