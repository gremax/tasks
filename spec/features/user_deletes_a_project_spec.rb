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
    expect(page).to have_content(user.email)
  end

  scenario "Delete an exists task", js: true do
    project = Project.order(:created_at).last
    expect(page).to have_content("Learn Ruby")
    find("#project_#{project.id}").hover
    find("#delete_project_#{project.id}").hover
    find("#delete_project_#{project.id}").click
    expect(page).to_not have_content("Learn Ruby")
  end
end