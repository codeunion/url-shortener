require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:invalid_user) do
    {email: ""}
    {password: "123"}
    {password_confirmation: "password"}
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new user" do 
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the root URL" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_user}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_user}
        expect(response).to render_template(:new)
      end
    end
  end

end