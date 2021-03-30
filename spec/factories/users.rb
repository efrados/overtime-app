FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email {generate :email}
    password {"password"}
    password_confirmation {"password"}
  end
  factory :admin_user, class: "AdminUser" do
    first_name { "admin" }
    last_name  { "user" }
    email {generate :email}
    password {"password"}
    password_confirmation {"password"}
  end
end