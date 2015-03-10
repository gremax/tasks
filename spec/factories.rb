FactoryGirl.define do
  factory :user do
    id 1
    email "user@example.org"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :project do
    name "Learn Ruby"
    user_id 1
  end
end