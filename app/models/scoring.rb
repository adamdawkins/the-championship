class Scoring < ApplicationRecord
  belongs_to :task
  belongs_to :scoreable, polymorphic: true

  validates :amount, presence: true
end
