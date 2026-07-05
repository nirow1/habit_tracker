class Goal < ApplicationRecord
  belongs_to :habit
  has_many :check_ins, dependent: :destroy

  validates :title, presence: true
  validates :target_value, numericality: { greater_than: 0 }
  validates :current_value, numericality: { greater_than_or_equal_to: 0 }
  validates :start_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "must be after start date") if end_date <= start_date
  end
end