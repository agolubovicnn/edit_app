class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :char_name
      t.string :image
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :characters, :users
  end
end
