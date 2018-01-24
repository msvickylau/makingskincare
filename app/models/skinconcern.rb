class Skinconcern < ActiveRecord::Base
  has_many :skinconcern_formulas
  has_many :formulas, through: :skinconcern_formulas
end
