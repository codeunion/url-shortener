require 'rails_helper'

RSpec.describe "Links", :type => :request do
  describe "GET /links/news" do
    it "renders the new template" do
      get new_link_path

      expect(response).to render_template(:new)
      expect(response.status).to be(200)
    end
  end

  describe "GET /l/:short_name" do
    context "when short_name exists" do
      let(:link) { FactoryGirl.create(:link) }

      it "redirects to the link's URL" do
        get link_path(link)

        expect(response).to redirect_to(link.url)
        expect(response.status).to be(302)
      end
    end

    context "when the short_name doesn't exist" do
      it "responds with a 404" do
        get link_path("does-not-exist")

        expect(response.status).to be(404)
      end
    end
  end
end
