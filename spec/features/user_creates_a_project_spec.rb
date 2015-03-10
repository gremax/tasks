require 'rails_helper'

feature "User creates a project" do
  let(:user)    { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }

  before do
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
    expect(page).to have_content("Sign out")
  end

  scenario "Add a new project", js: true do
    find("#new_link").click
    fill_in "project_name", with: "Vanilla Ice"
    click_button "Create"
    expect(page).to have_content("Vanilla Ice")
  end
end