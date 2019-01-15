class Team < ApplicationRecord
  belongs_to :term

  validates :name, uniqueness: { scope: :term }
end
