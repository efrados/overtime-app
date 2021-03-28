user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "John",last_name: "Snow")
puts "User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: user)
end
puts "100 posts created"