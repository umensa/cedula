require 'rails_helper'

RSpec.describe "mentors/show", type: :view do
  before(:each) do
    @mentor = assign(:mentor, Mentor.create!(
      mentor_name: "Mentor Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mentor Name/)
  end
end
