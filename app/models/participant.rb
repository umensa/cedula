class Participant < ApplicationRecord
  validates :participant_name, presence: true
  validates :session_id, presence: true
  validates :session_id, numericality: { only_integer: true }
  
  has_and_belongs_to_many :sessions
end
