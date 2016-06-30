class CreateForAttributes < ActiveRecord::Migration
  def change
    create_table :for_attributes do |t|
      t.string :name
      t.integer :value
      t.string :image
      t.references :character, index: true

      t.timestamps null: false
    end
    add_foreign_key :for_attributes, :characters
  end
end
