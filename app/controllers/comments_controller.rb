class CommentsController < ApplicationController
  before_action :set_formula

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.formula = @formula
    if @comment.save
      render json: @comment, status: 201
    else
      render json: {errors: @comment.errors.full_messages}, status: 400
    end
  end

  private

  def set_formula
    @formula = Formula.find(params[:formula_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
