class Leader < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
