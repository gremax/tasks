require 'rails_helper'

feature "User deletes a task" do
  before do
    user = FactoryGirl.create(:user) do |user|
      user.projects.create(attributes_for(:project))
    end
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
    expect(page).to have_content("Sign out")
    within("#new_task") do
      fill_in "task_name", with: "Capybara"
      click_button "Add Task"
    end
    expect(page).to have_content("Capybara")
  end

  scenario "Delete am exists task", js: true do
    project = Project.order(:created_at).last
    expect(page).to have_content("Capybara")
    find("#project_#{project.id}").hover
    find("#task_1").hover
    find("#delete_task_1").hover
    find("#delete_task_1").click
    expect(page).to_not have_content("Capybara")
  end
end