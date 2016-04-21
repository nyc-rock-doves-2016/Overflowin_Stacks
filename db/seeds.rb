User.create!(
  username: "carl", 
  password: "pw", 
  email: "123@abc.com"
  )

9.times do User.create!(
  username: Faker::Internet.user_name, 
  password: "pw", 
  email: Faker::Internet.email
  )

end



10.times do
  Question.create!(
    title: Faker::Lorem.sentence(rand(1..4)),
    body: Faker::Hacker.say_something_smart,
    user_id: rand(1..10)
    )
end