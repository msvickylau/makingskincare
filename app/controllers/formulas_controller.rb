class FormulasController < ApplicationController
  before_action :find_formula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @formulas = Formula.all.order("created_at DESC")
  end

  def show
  end

  # def new
  #   @formula = Formula.new
  #   10.times { @formula.ingredients.build }
  # end

  # def create
  #   @formula = current_user.formulas.build(formula_params)
  #   if @formula.save
  #     redirect_to @formula, notice: "Yay! Successfully created new formula!"
  #   else
  #     render 'new'
  #   end
  # end


  def new
    @formula = Formula.new
    @formula.ingredients.build
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
        redirect_to @formula and return
      end
    end

    render :action => 'new'
  end

  def edit
  end

  # def update
  #   if @formula.update(formula_params)
  #     redirect_to @formula
  #   else
  #     render 'edit'
  #   end
  # end

  def update
    if params[:add_ingredient]
      # rebuild the ingredient attributes that doesn't have an id
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
        redirect_to @formula and return
      end
    end
    render :action => 'edit'
  end

  def destroy
    @formula.destroy
    redirect_to root_path, notice: "Sucessfully deleted formula."
  end

  private

  def formula_params
    params.require(:formula).permit(
      :user_id, 
      :title, 
      :description, 
      :direction, 
      :image, 
      :image_delete,
      :add_ingredient,
      :remove_ingredient,
      :category_id,
      :ingredients_attributes => [:name],
      :ingredient_ids => []

    )
  end

  def find_formula
    @formula = Formula.find(params[:id])
  end

end #of class FormulasController
