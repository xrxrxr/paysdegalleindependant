require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #user" do
    it "assign @user" do 
      @user = User.create

      get :user, first_name: user.first_name
      get :user, last_name: @user.last_name
      expect(assigns(:user).to eq(@user))
    end
    
    it "render the show template" do
      get :show
      expect(response).to render_template("users/show")
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
