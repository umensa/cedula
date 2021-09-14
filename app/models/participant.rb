class Participant < ApplicationRecord
  validates_associated :session
  
  belongs_to :session
  has_many :mentors, through: :sessions
end
