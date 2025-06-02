class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }
  validates :actor, presence: true, uniqueness: { case_sensitive: false }
  validates :editora, presence: true, uniqueness: { case_sensitive: false }
  validates :ano_public, presence: true, uniqueness: { case_sensitive: false }
  has_many :users, through: :loans #usando o throug eu faço uma associação aonde a tabela intermediaria sera o loans
  has_many :loans, dependent: :destroy
end
