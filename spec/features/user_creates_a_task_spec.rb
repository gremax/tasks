require 'rails_helper'

feature "User creates a task" do
  before do
    user = FactoryGirl.create(:user) do |user|
      user.projects.create(attributes_for(:project))
    end
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
    expect(page).to have_content("Sign out")
  end

  scenario "Add a new task", js: true do
    within("#new_task") do
      fill_in "task_name", with: "Capybara"
      click_button "Create Task"
    end
    expect(page).to have_content("Capybara")
  end
end