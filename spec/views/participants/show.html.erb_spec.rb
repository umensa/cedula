require 'rails_helper'

RSpec.describe "participants/show", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      participant_name: "Participant Name",
      session: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Participant Name/)
    expect(rendered).to match(//)
  end
end
