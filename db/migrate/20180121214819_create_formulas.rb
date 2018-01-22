class CreateFormulas < ActiveRecord::Migration
  def change
    create_table :formulas do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :direction

      t.timestamps null: false
    end
  end
end
