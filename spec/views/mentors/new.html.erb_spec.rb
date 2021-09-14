require 'rails_helper'

RSpec.describe "mentors/new", type: :view do
  before(:each) do
    assign(:mentor, Mentor.new(
      mentor_name: "MyString"
    ))
  end

  it "renders new mentor form" do
    render

    assert_select "form[action=?][method=?]", mentors_path, "post" do

      assert_select "input[name=?]", "mentor[mentor_name]"
    end
  end
end
