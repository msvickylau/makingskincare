class Formula < ActiveRecord::Base
  belongs_to :user
  has_many :categories 
  has_many :formula_ingredient
  has_many :ingredients, through: :formula_ingredient
end
