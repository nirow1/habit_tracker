class Habit < ApplicationRecord
  has_many :goals, dependent: :destroy

  validates :name, presence: true
  validates :frequency_type, presence: true, inclusion: { in: %w[daily weekly monthly] }
end