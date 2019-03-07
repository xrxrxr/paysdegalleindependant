require 'rails_helper'


describe "the order_process", type: :feature do

  it "create an order that appear in the my orders tab" do
      user = FactoryBot.create(:user) 
      visit new_user_session_path
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      click_button 'Log in'
      order = FactoryBot.create(:order, user: user)
      visit cart_orders_path(user.cart.id)

      expect(page).to have_content Time.now.to_s[0..-16]
  end
end