class Term < ApplicationRecord
  has_many :teams
  has_many :contestants
end
