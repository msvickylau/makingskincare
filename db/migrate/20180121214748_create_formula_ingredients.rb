class CreateFormulaIngredients < ActiveRecord::Migration
  def change
    create_table :formula_ingredients do |t|
      t.references :formula
      t.references :ingredient
      t.references :measurement

      t.timestamps null: false
    end
  end
end
