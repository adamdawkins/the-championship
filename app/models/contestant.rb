class Contestant < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
