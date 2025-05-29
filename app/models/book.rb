class Book < ApplicationRecord
  has_many :users, through: :loans
  has_many :loans, dependent: :destroy
end