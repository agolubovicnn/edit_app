require 'rails_helper'

RSpec.describe "ForAttributes", :type => :request do
  describe "GET /for_attributes" do
    it "works! (now write some real specs)" do
      get for_attributes_path
      expect(response).to have_http_status(200)
    end
  end
end
