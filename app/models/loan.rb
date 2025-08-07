class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

enum status: { emprestado: 0, devolvido: 1 }
#emprestado e o nome do scope, e o lambda que retorna a query
#book ele serve como parametro de consulta, aonde os livros que possui status emprestado
#where vai ser a busca dos registro aonde possui livros com status emprestado
#scope pode encadear metodos de buscas, caso quiser fazer outro tipo de busca exemplo: Loan.emprestado.orderm_por_nome, ele ira funcionar.
  scope :emprestado, ->(book) { where(book: book, status: :emprestado) }
  scope :empresto_mais_3, ->(user) { where(user: user, status: :emprestado) }

  def self.livro_emprestado?(book)
    emprestado(book).exists?
  end

  def self.emprestado_3?(user)
    empresto_mais_3(user).count >= 3
  end
end
