class CertificationType < ApplicationRecord
  validates :description, presence: true
  validates :description, uniqueness: true
end
