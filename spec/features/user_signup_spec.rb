require 'rails_helper'

feature "User signup" do
  let(:user) { FactoryGirl.build(:user) }

  before do
    visit root_path
    click_on ("Don't have an account?")
  end

  scenario "with valid information" do
    fill_in "Email",    with: "user@example.org"
    fill_in "Password", with: "foobar"
    fill_in "Password confirmation", with: "foobar"
    expect { click_button "Sign up" }.to change(User, :count).by(1)
    expect(page).to have_content("Sign out")
  end

  scenario "with invalid information" do
    click_button "Sign up"
    expect { click_button "Sign up" }.not_to change(User, :count)
  end

  scenario "when password is too short" do
    fill_in "Email",    with: "user@example.org"
    fill_in "Password", with: "a" * 5
    click_button "Sign up"
    expect(page).to have_content("too short")
  end
end