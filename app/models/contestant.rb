class Contestant < ApplicationRecord
  belongs_to :term
  belongs_to :team, optional: true

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :term }
end
