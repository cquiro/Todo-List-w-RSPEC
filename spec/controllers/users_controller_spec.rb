require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:valid_attributes) {
    { "first_name" => "My first", 
      "last_name" => "My last", 
      "email" => "my@email.com", 
      "password" => "password", 
      "password_confirmation" => "password" }
  }

  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the homepage (todo lists index)" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(todo_lists_path)
      end

      it "sets the flash success message" do
        post :create, {:user => valid_attributes}, valid_session
        expect(flash[:success]).to eq("Thanks for signing up!")
      end

      it "sets the session user_id to the created user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(session[:user_id]).to eq(User.find_by(email: valid_attributes["email"]).id)
      end
    end
  end
end
