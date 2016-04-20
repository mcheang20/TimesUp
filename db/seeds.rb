5.times do

  User.create!(

    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: Faker::Internet.password(8)
  )
  end
  users = User.all

  25.times do

    Item.create!(

      user: users.sample,
      name: Faker::Lorem.word
    )
  end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
