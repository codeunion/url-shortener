require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  let(:user) do
    {email: 'test@email.com', password: 'password123' }
  end

  describe "#create" do
    context "with valid params" do

      it "creates a user session" do
        expect(session[:user_id]).to be_user.id
      end
    end
  end

  describe "#destroy" do
    context "when user logged in" do
      it "destroys user session" do
        expect(session[:user_id]).to be_nil
      end
    end
  end
end
