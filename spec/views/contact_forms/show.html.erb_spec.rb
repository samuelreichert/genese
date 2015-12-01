require 'rails_helper'

RSpec.describe "contact_forms/show", type: :view do
  before(:each) do
    @contact_form = assign(:contact_form, ContactForm.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
