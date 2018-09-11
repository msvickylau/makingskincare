class SkinconcernsController < ApplicationController
  def index
   @skinconcerns = Skinconcern.all.order("name ASC").select { |concern| !concern[:name].blank? }
  end

  def show
    @skinconcern = Skinconcern.find(params[:id])
    @formulas = @skinconcern.formulas.order("created_at DESC")
    @formulas_with_no_skinconcern_tags = Formula.all.select{ |formula| formula.skinconcerns.count == 1 }

    respond_to do |format|
      format.html { render :show }
      format.json { render json:  @skinconcern }
    end
  end

  def next_skinconcern # get '/skinconcerns/:id/next', to: 'skinconcerns#next_skinconcern'
    @skinconcern = Skinconcern.find(params[:id])
    @next_skinconcern = @skinconcern.next
    render json: @next_skinconcern
  end

  def previous_skinconcern # get '/skinconcerns/:id/previous', to: 'skinconcerns#previous_skinconcern'
    @skinconcern = Skinconcern.find(params[:id])
    @previous_skinconcern = @skinconcern.previous
    render json: @previous_skinconcern
  end

end
