class EmissionSector < ApplicationRecord
  validates :description, presence: true
  validates :description, uniqueness: true
end
