require 'rails_helper'

RSpec.describe "tutorials/show", type: :view do
  before(:each) do
    @tutorial = assign(:tutorial, Tutorial.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
