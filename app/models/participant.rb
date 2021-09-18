class Participant < ApplicationRecord
  belongs_to :sessions
  has_many :mentors, :through => :sessions
end
