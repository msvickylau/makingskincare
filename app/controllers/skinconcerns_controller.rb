class SkinconcernsController < ApplicationController
  def index
   @skinconcerns = Skinconcern.all.order("name ASC").select { |concern| !concern[:name].blank? }
  end

  def show
    @skinconcern = Skinconcern.find(params[:id])
    @formula = @skinconcern.formulas.order("created_at DESC")
  end
end
