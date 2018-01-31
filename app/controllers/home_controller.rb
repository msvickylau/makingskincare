class HomeController < ApplicationController

  def index
    @face_categories = Category.all.where(:part => 'face')
    @hair_categories = Category.all.where(:part => 'hair')
    @body_categories = Category.all.where(:part => 'body')

    @skinconcerns = Skinconcern.all.order("name ASC").select { |concern| !concern[:name].blank? }

    @formulas = Formula.all.order("created_at DESC")
  end
end
