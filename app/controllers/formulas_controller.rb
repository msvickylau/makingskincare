class FormulasController < ApplicationController
  before_action :find_formula, only: [:show, :edit, :update, :destroy]

  def index
    @formulas = Formula.all.order("created_at DESC")
  end

  def show
  end

  def new
    @formula = Formula.new
  end

  def create
    @formula = Formula.new(formula_params)

    if @formula.save
      redirect_to @formula, notice: "Yay! Successfully created new formula!"
    else
      redner 'new'
    end
  end

  def edit
  end

  def update
    if @formula.update(formula_params)
      redirect_to @formula
    else
      render 'edit'
    end
  end

  def destroy
    @formula.destroy
    redirect_to root_path, notice: "Sucessfully deleted formula."
  end

  private

  def formula_params
    params.require(:formula).permit(:user_id, :title, :description, :direction, :image)
  end

  def find_formula
    @formula = Formula.find(params[:id])
  end

end
