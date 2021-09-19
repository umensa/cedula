require 'rails_helper'

RSpec.describe Participant, type: :model do
  subject { Participant.new(participant_name: "Tom", FactoryBot.create(:session)) }
end
