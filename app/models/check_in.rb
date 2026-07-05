class CheckIn < ApplicationRecord
  belongs_to :goal

  validates :date, presence: true
  validates :value, numericality: { greater_than: 0 }
end