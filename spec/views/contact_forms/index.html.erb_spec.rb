require 'rails_helper'

RSpec.describe "contact_forms/index", type: :view do
  before(:each) do
    assign(:contact_forms, [
      ContactForm.create!(),
      ContactForm.create!()
    ])
  end

  it "renders a list of contact_forms" do
    render
  end
end
