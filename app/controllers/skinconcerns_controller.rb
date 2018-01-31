class SkinconcernsController < ApplicationController
  def index
   @skinconcerns = Skinconcern.all.order("name ASC").select { |concern| !concern[:name].blank? }
  end

  def show
    @skinconcern = Skinconcern.find(params[:id])
  end
end
