class Ingredient < ActiveRecord::Base
  has_many :formula_ingredient
  has_many :formulas, through: :formula_ingredient
  has_many :measurements, through: :formula_ingredient
end
