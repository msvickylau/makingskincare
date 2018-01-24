class CreateSkinconcerns < ActiveRecord::Migration
  def change
    create_table :skinconcerns do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
