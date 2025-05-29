class AddColumnLoan < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :data_devolucao_real, :date
  end
end
