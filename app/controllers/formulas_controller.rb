class FormulasController < ApplicationController
  before_action :find_formula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # GET /users/#/formulas
    if params[:user_id]
      @formulas = User.find(params[:user_id]).formulas.order("created_at DESC")
    
    # GET /formulas
    else
      @formulas = Formula.all.order("created_at DESC")
    end
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json:  @formulas }
    end
  end

  def show
    @formula = Formula.find(params[:id])
    if current_user
      @comment = current_user.comments.build(formula: @formula)
    end
      respond_to do |format|
      format.html { render :show }
      format.json { render json:  @formula }
    end
  end

  def new
    @formula = Formula.new
    @formula.ingredients.build
  end

  def edit
  end

  def create
    @formula = Formula.new(formula_params)
    @formula.user_id = current_user.id

    if params[:add_ingredient]
      # add empty ingredient associated with @formula
      @formula.ingredients.build
    elsif params[:remove_ingredient]
      # nested model that have _destroy attribute = 1 automatically deleted by rails
    else
      # save goes like usual
      if @formula.save
        flash[:message] = "Sucessfully created formula!"
        redirect_to @formula and return
      end
    end
    render :action => 'new'
  end

  def update
    if params[:add_ingredient]
      # rebuild the ingredient attributes that doesn't have an id, newly added ingredient that hasn't been saved yet. 
      unless params[:formula][:ingredients_attributes].blank?
        for attribute in params[:formula][:ingredients_attributes]
          @formula.ingredients.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      # add one more empty ingredient attribute
      @formula.ingredients.build
    elsif params[:remove_ingredient]
      # collect all marked for delete ingredient ids
      removed_ingredients = params[:formula][:ingredients_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # physically delete the ingredients from database
      Ingredient.delete(removed_ingredients)
      for attribute in params[:formula][:ingredients_attributes]
        # rebuild ingredients attributes that doesn't have an id and its _destroy attribute is not 1
        @formula.ingredients.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
    else
      # save goes like usual
      if @formula.update_attributes(formula_params)
        flash[:message] = "Your Formula has been updated!"
        redirect_to @formula and return
      end
    end
    render :action => 'edit'
  end

  def destroy
    @formula.destroy
    flash[:message] = "Your Formula has been deleted!"
    redirect_to root_path
  end

  private

  def formula_params
    params.require(:formula).permit(
      :user_id, 
      :title, 
      :description, 
      :category_id,
      :image, 
      :image_delete,
      :direction,
      :add_ingredient,
      :remove_ingredient,
      :ingredients_attributes => [:id, :name],
      :skinconcern_ids => [],
      :skinconcerns_attributes => [:name]
    )
  end

  def find_formula
    @formula = Formula.find(params[:id])
  end

end #of class FormulasController
