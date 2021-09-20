require 'rails_helper'

RSpec.describe "participants/edit", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      participant_name: "MyString",
      session: nil
    ))
  end

  it "renders the edit participant form" do
    render

    assert_select "form[action=?][method=?]", participant_path(@participant), "post" do

      assert_select "input[name=?]", "participant[participant_name]"

      assert_select "input[name=?]", "participant[session_id]"
    end
  end
end
