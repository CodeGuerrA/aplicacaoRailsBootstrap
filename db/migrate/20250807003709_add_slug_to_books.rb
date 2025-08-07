class AddSlugToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :slug, :string #lembrar de colocar isso como obrigatorio
    add_index :books, :slug, unique: true #aqui fara o slug ser unico por livro
  end
end
