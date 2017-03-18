FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@email.com"
  end

  factory :user do
    name "John Doe"
    email { generate :email }
    password "testtest"
    password_confirmation "testtest"
    confirmed_at Date.today
  end

  factory :non_auth_user, class: "User" do
    name "Non Authorized"
    email { generate :email }
    password "password123"
    password_confirmation "password123"
    confirmed_at Date.today
  end
end