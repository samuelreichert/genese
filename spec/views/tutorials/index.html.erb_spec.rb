require 'rails_helper'

RSpec.describe "tutorials/index", type: :view do
  before(:each) do
    assign(:tutorials, [
      Tutorial.create!(),
      Tutorial.create!()
    ])
  end

  it "renders a list of tutorials" do
    render
  end
end
