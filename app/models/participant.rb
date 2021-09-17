class Participant < ApplicationRecord
  has_many :sessions
  has_many :mentors, :through => :sessions
end
