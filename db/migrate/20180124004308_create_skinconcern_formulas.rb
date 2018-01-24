class CreateSkinconcernFormulas < ActiveRecord::Migration
  def change
    create_table :skinconcern_formulas do |t|

      t.timestamps null: false
    end
  end
end
