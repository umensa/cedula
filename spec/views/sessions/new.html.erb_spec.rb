require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  before(:each) do
    assign(:session, Session.new(
      topic: "MyString",
      mentor: nil
    ))
  end

  it "renders new session form" do
    render

    assert_select "form[action=?][method=?]", sessions_path, "post" do

      assert_select "input[name=?]", "session[topic]"

      assert_select "input[name=?]", "session[mentor_id]"
    end
  end
end
