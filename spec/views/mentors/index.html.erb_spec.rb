require 'rails_helper'

RSpec.describe "mentors/index", type: :view do
  before(:each) do
    assign(:mentors, [
      Mentor.create!(
        mentor_name: "Mentor Name"
      ),
      Mentor.create!(
        mentor_name: "Mentor Name"
      )
    ])
  end

  it "renders a list of mentors" do
    render
    assert_select "tr>td", text: "Mentor Name".to_s, count: 2
  end
end
