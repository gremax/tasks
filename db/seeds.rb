Project.destroy_all

Project.create!(name: "Complete the test task for Ruby Garage")
Project.create!(name: "For Home")
Project.create!(name: "Learn Ruby")

p "Added #{Project.count} projects."