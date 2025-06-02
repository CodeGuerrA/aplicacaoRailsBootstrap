class DeleteColumnDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :loans, :data_devolucao_real
  end
end
