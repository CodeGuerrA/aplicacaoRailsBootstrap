class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.date :data_emprestimo
      t.date :data_devolucao_prevista
      t.integer :status
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end