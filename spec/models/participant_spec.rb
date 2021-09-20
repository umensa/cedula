require 'rails_helper'

RSpec.describe Participant, type: :model do
  subject { Participant.new(participant_name: "Tom", session_id: FactoryBot.create(:session).id) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid    
  end

  it "is not valid without a participant_name" do
    expect(subject.participant_name = "").to be_empty
    expect(subject).to_not be_valid

    subject.participant_name = nil
    expect(subject).to_not be_valid
  end
end
