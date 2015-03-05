User.destroy_all
Task.destroy_all
Project.destroy_all

user = User.create!(email: "user@example.com",password: "password", password_confirmation: "password")

first  = Project.create!(name: "Complete the test task for Ruby Garage", user_id: user.id)
second = Project.create!(name: "For Home", user_id: user.id)
third  = Project.create!(name: "Learn Ruby", user_id: user.id)

Task.create!([
  { name: "Open this mock-up in Adobe Fireworks", project_id: first.id },
  { name: "Attentively check the file", project_id: first.id },
  { name: "Write HTML & CSS", project_id: first.id },
  { name: "Add Javascript to implement adding / editing/ removing for todo items and lists taking into account as more use cases as possible", project_id: first.id },
  { name: "Buy a milk", project_id: second.id },
  { name: "Call Mom", project_id: second.id },
  { name: "Clean the room", project_id: second.id },
  { name: "Repair the DVD Player", project_id: second.id },
  { name: "Haml & Slim", project_id: third.id },
  { name: "Deploy with Capistrano", project_id: third.id },
  { name: "PostgreSQL", project_id: third.id }
])

p "Added #{Project.count} projects with #{Task.count} tasks for #{user.email}"