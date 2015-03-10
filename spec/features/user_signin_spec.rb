require 'rails_helper'

feature "User signin" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    visit signup_path
    click_on ("Already have an account")
  end

  scenario "with valid information" do
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
    expect(page).to have_content("Sign out")
  end

  scenario "with invalid information" do
    click_button "Login"
    expect(page).to have_content("Invalid combination")
  end
end