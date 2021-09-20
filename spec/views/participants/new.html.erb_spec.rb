require 'rails_helper'

RSpec.describe "participants/new", type: :view do
  before(:each) do
    assign(:participant, Participant.new(
      participant_name: "MyString",
      session: nil
    ))
  end

  it "renders new participant form" do
    render

    assert_select "form[action=?][method=?]", participants_path, "post" do

      assert_select "input[name=?]", "participant[participant_name]"

      assert_select "input[name=?]", "participant[session_id]"
    end
  end
end
