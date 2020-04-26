class Participant < ApplicationRecord
  validates :name, presence: true
  validates :rg, presence: true
  validates :rg, uniqueness: true
end
