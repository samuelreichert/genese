require 'rails_helper'

RSpec.describe "tutorials/new", type: :view do
  before(:each) do
    assign(:tutorial, Tutorial.new())
  end

  it "renders new tutorial form" do
    render

    assert_select "form[action=?][method=?]", tutorials_path, "post" do
    end
  end
end
