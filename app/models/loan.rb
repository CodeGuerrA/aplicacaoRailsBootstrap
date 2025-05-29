class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: {emprestado:0, devolvido:1}
scope :emprestado, -> (book) { where(book: book, status: :emprestado)}
scope :empresto_mais_3?, ->(user) {where(user: user, satus: :emprestado)}

private
  def self.livro_emprestado?(book)
emprestado(book).exist?
end

def self.emprestado_3?(user)
  empresto_mais_3(user).count < 3
end
end