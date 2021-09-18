class Session < ApplicationRecord
  belongs_to :mentor
  has_many :participants, dependent: :destroy
end
