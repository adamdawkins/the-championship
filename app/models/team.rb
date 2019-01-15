class Team < ApplicationRecord
  belongs_to :term
  has_many :contestants
  has_many :scorings, as: :scoreable

  validates :name, uniqueness: { scope: :term }

  def score
    scorings.sum(&:amount)
  end
end
