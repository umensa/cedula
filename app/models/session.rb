class Session < ApplicationRecord
  belongs_to :mentor
  has_and_belongs_to_many :participants
end
