class Team < ApplicationRecord
  belongs_to :term
  has_many :contestants

  validates :name, uniqueness: { scope: :term }
end
