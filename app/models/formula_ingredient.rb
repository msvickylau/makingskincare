class FormulaIngredient < ActiveRecord::Base
  belongs_to :formula
  belongs_to :ingredient
  belongs_to :measurement
end
