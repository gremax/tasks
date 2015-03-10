require 'rails_helper'

feature "User edits a project" do
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

  scenario "Edit an exist project name", js: true do
    project = Project.order(:created_at).last
    expect(page).to have_content("Learn Ruby")
    find("#project_#{project.id}").hover
    find("#edit_project_#{project.id}").hover
    find("#edit_project_#{project.id}").click
    bip_area project, :name, "Learn RoR"
    # print page.html
  end
end