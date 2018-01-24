class CreateSkinconcernFormulas < ActiveRecord::Migration
  def change
    create_table :skinconcern_formulas do |t|
      t.integer :skinconcern_id
      t.integer :formula_id

      t.timestamps null: false
    end
  end
end
