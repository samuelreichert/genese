require 'rails_helper'

RSpec.describe "tutorials/edit", type: :view do
  before(:each) do
    @tutorial = assign(:tutorial, Tutorial.create!())
  end

  it "renders the edit tutorial form" do
    render

    assert_select "form[action=?][method=?]", tutorial_path(@tutorial), "post" do
    end
  end
end
