class Mentor < ApplicationRecord
  validates :mentor_name, presence: true

  has_many :sessions, dependent: :destroy
end
