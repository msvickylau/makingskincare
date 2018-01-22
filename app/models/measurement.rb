class Measurement < ActiveRecord::Base
  has_many :formula_ingredient
  has_many :ingredients, through: :formula_ingredient
end
