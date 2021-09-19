require 'rails_helper'

RSpec.describe Mentor, type: :model do
  let(:subject) {
    Mentor.create(
      mentor_name: "John"
    )
  }

  it "is valid with valid attribtes" do
    expect(subject).to be_valid
  end

  it "is not valid without a mentor_name" do
    expect(subject.mentor_name = "").to be_empty
    expect(subject).to_not be_valid

    subject.mentor_name = nil
    expect(subject).to_not be_valid
  end
end
