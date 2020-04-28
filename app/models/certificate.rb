class Certificate < ApplicationRecord
  belongs_to :participant
  belongs_to :event
  belongs_to :certification_type
  belongs_to :emission_sector

  has_one_attached :anexo
  validates :year, presence: true
  validates :date_issue, presence: true
  validates :title, presence: true
  validates :initial_period, presence: true
  validates :final_period, presence: true
  validates :workload, presence: true
  validates :anexo, attached:true,
    size: { less_than: 1.megabytes },
    content_type: %i[pdf]
end
