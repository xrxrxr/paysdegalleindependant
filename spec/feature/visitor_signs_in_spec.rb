require 'rails_helper'


describe "the signin process", type: :feature do
  before :each do
    FactoryBot.create(:user, email: 'user@example.com', password: 'password') 
  end

  it "signs me in" do
    # on va sur la page de création d'utilisateurs
    visit new_user_session_path

    # dans le formulaire des users, on remplit les données qu'il faut

    fill_in :user_email, with: 'user@example.com'
    fill_in :user_password, with: 'password'

    # clik clik
    click_button 'Log in'

    # la page affichée devrait afficher des bonnes nouvelles
    expect(page).to have_content 'successfully'
  end
end
