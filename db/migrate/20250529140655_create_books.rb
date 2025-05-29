class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title 
      t.string :actor 
      t.string :editora 
      t.integer :ano_public

      t.timestamps
    end
  end
end
