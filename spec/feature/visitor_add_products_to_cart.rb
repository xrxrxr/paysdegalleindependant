require 'rails_helper'


describe "the cart_process", type: :feature do
  before :each do
    sign_in
  end

  it "add a product" do
    add_to_cart
    # la page affichée devrait afficher des bonnes nouvelles
    expect(page).to have_content 'MON PANIER (1)'
  end

  it "add a product that appear in cart" do
    add_to_cart

    visit cart_path(1)
    expect(page).to have_content 'by KittyCats'
    expect(page).to have_content 'Purchase'
    expect(page).to have_content 'Vider le panier'
  end

  it "add a product buyable" do
    add_to_cart
    visit new_cart_order_path(1)

    expect(page).to have_content 'Adresse a laquelle la photo sera envoyee '
    # expect(page).to have_css '.stripe-button-el'
    expect(page).to_not have_content 'Vider le panier'
  end

  it "doesnt add a product that doesnt appear in cart" do
    visit cart_path(1)
    expect(page).to have_content '€ 0'
    expect(page).to_not have_content 'Purchase'
    expect(page).to_not have_content 'Vider le panier'
  end

  it "can add more of the same product from cart" do
    add_to_cart
    visit cart_path(1)
    find("#add-product").click
    expect(page).to have_content 'MON PANIER (2)'
  end

  it "can remove number of the same product from cart" do
    add_to_cart
    visit cart_path(1)
    find("#remove-product").click
    expect(page).to have_content 'MON PANIER (0)'
  end

  # it "can remove product from cart" do
  #   product = FactoryBot.create(:product) 
  #   visit product_path(product.id)
  #   click_link 'Add to cart'
  #   visit cart_path(1)
  #   find("#remove-col-product-#{product.id}").click
    
  #   expect(page).to_not have_content 'Purchase'
  #   expect(page).to_not have_content 'Vider le panier'
  #   expect(page).to have_content 'MON PANIER (0)'
  # end


  def add_to_cart
    product = FactoryBot.create(:product) 
    visit product_path(product.id)
    click_link 'Add to cart'
  end

  def sign_in
      user = FactoryBot.create(:user, email: 'user@example.com', password: 'password') 
      visit new_user_session_path
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      click_button 'Log in'
  end
end