require 'rails_helper'

RSpec.describe "ContactForms", type: :request do
  describe "GET /contact_forms" do
    it "works! (now write some real specs)" do
      get contact_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
