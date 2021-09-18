class Mentor < ApplicationRecord
  has_many :sessions, dependent: :destroy
end
