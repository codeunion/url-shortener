require 'rails_helper'

RSpec.describe "Links", :type => :request do
  describe "GET /links/news" do
    it "renders the new template" do
      get new_link_path

      expect(response).to render_template(:new)
      expect(response.status).to be(200)
    end
  end
end
