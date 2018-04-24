class FormulasController < ApplicationController
  before_action :find_formula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # GET /users/#/formulas
    if params[:user_id]
      @formulas = User.find(params[:user_id]).formulas.order("created_at DESC")
    
    # GET /formulas
    # GET /formulas.json
    else
      @formulas = Formula.all.order("created_at DESC")
    end
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json:  @formulas }
    end
  end

  # GET /formulas/1
  # GET /formulas/1.json
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

  # GET /users/1/formulas/new
  # GET /formulas/new
  def new
    @formula = Formula.new
    @formula.ingredients.build
  end

  # GET /formulas/4/edit
  # GET /users/1/formulas/4/edit
  def edit
  end

  # POST /formulas
  def create
    @formula = Formula.new(formula_params)
    @formula.user_id = current_user.id

    if @formula.save
      flash[:message] = "Sucessfully created formula!"
      redirect_to @formula
    else
      render 'new'
    end
  end

  # PATCH/PUT /formulas/1
  def update
    if @formula.update_attributes(formula_params)
      flash[:message] = "Your Formula has been updated!"
      redirect_to @formula
    else
      render :action => 'edit'
    end
  end

  # DELETE /formulas/1
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
