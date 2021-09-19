require 'rails_helper'

RSpec.describe Session, type: :model do
  session = FactoryBot.create(:session)
  end_start = FactoryBot.create(:session)

  it "is valid with valid attributes" do
    expect(session).to be_valid
  end

  it "is not valid without a topic" do
    expect(session.topic = "").to be_empty
    expect(session).to_not be_valid 

    session.topic = nil
    expect(session).to_not be_valid
  end

  it "is not valid without a mentor" do
    expect(session.mentor_id = "").to be_empty
    expect(session).to_not be_valid

    session.mentor_id = 0
    expect(session).to_not be_valid
    
    session.mentor_id = nil
    expect(session).to_not be_valid
  end

  it "is not valid without a start_time" do
    expect(session.start_time = "").to be_empty
    expect(session).to_not be_valid

    session.start_time = 0
    expect(session).to_not be_valid
    
    session.start_time = nil
    expect(session).to_not be_valid
  end

  it "is not valid without a end_time" do
    expect(session.end_time = "").to be_empty
    expect(session).to_not be_valid

    session.end_time = 0
    expect(session).to_not be_valid
    
    session.end_time = nil
    expect(session).to_not be_valid

    session.end_time = session.start_time
    expect(session).to_not be_valid

    session.start_time = end_start.end_time
    session.end_time = end_start.start_time
    expect(session).to_not be_valid
  end
end
