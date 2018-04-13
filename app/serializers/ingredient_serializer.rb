class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :formula
end
