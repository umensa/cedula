class Mentor < ApplicationRecord
  has_many :sessions
  has_many :participants, through: :sessions
end
