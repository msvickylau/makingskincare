class CreateSkinConcerns < ActiveRecord::Migration
  def change
    create_table :skin_concerns do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
