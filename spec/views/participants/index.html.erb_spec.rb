require 'rails_helper'

RSpec.describe "participants/index", type: :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        participant_name: "Participant Name",
        session: nil
      ),
      Participant.create!(
        participant_name: "Participant Name",
        session: nil
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", text: "Participant Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
