require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  	before do
      routes.draw { get 'show' => 'carts#show' }
      get :show
    end

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {}

  let(:invalid_attributes) { }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "GET #show" do
    it "returns a success response" do
      cart = Cart.create! valid_attributes
      get :show, params: {id: cart.to_param}, session: valid_session
      expect(response).to be_successful
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template("show")
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "creates a new cart" do
        expect {
          FactoryBot.create(:cart)
        }.to change(Cart, :count).by(1)
      end

      it "redirects to the created cart" do
        cart = FactoryBot.create(:cart)
        expect(response).to render_template(:show)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {user: FactoryBot.create(:user)} }

      it "updates the requested cart" do
        cart = FactoryBot.create(:cart)
        cart.update!(user: FactoryBot.create(:user))
        cart.reload
      end

      it "redirects to the cart" do
        cart = FactoryBot.create(:cart)
        cart.update!(user: FactoryBot.create(:user))
        expect(response.content_type).to eq 'text/html'
        expect(response.status).to eq(200)  
      end
    end
  end
end
