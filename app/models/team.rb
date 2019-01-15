class Team < ApplicationRecord
  belongs_to :term
  has_many :contestants
  has_many :scorings, as: :scoreable

  validates :name, uniqueness: { scope: :term }
end
