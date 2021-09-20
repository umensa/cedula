require 'rails_helper'

RSpec.describe "mentors/edit", type: :view do
  before(:each) do
    @mentor = assign(:mentor, Mentor.create!(
      mentor_name: "MyString"
    ))
  end

  it "renders the edit mentor form" do
    render

    assert_select "form[action=?][method=?]", mentor_path(@mentor), "post" do

      assert_select "input[name=?]", "mentor[mentor_name]"
    end
  end
end
