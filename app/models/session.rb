class Session < ApplicationRecord
  validates :topic, presence: true
  validates :mentor_id, presence: true
  validates :mentor_id, numericality: { only_integer: true }
  validates_presence_of :start_time, :end_time
  validate :end_time_is_after_start_time

  private
  def end_time_is_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "cannot be before or at the start time")
    end
  end

  belongs_to :mentor
  has_many :participants, dependent: :destroy
end
