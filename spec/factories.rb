FactoryGirl.define do
  factory :user do
    id 1
    email "user@example.org"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :project do
    id 1
    name "Learn Ruby"
    user_id 1
  end

  factory :task do
    id 1
    name "Capybara"
    project_id 1
  end
end