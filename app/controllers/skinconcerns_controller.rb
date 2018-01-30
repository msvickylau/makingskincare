class SkinconcernsController < ApplicationController

  def index
   @skinconcerns = Skinconcern.all.order("name ASC")
  end

  def show
    @skinconcern = Skinconcern.find(params[:id])
  end


end
