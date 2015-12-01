require 'rails_helper'

RSpec.describe "contact_forms/new", type: :view do
  before(:each) do
    assign(:contact_form, ContactForm.new())
  end

  it "renders new contact_form form" do
    render

    assert_select "form[action=?][method=?]", contact_forms_path, "post" do
    end
  end
end
