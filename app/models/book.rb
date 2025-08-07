class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }
  validates :actor, presence: true, uniqueness: { case_sensitive: false }
  validates :editora, presence: true, uniqueness: { case_sensitive: false }
  validates :ano_public, presence: true, uniqueness: { case_sensitive: false }

  has_many :users, through: :loans
  has_many :loans, dependent: :destroy

  before_validation :generate_slug, on: :create

  def to_param
    slug
  end

  private

  def generate_slug
    base_slug = title.to_s.parameterize
    slug_candidate = base_slug
    count = 2
    while Book.exists?(slug: slug_candidate)
      slug_candidate = "#{base_slug}-#{count}"
      count += 1
    end
    self.slug = slug_candidate
  end
end
