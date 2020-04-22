
Sneaker.destroy_all
User.destroy_all
Shop.destroy_all

26.times do
  User.create(name: Faker::Sports::Basketball.player)
end

30.times do
  Sneaker.create(style:['Yeezy Boost 350','Yeezy 950','Yeezy 350 Cleat','Yeezy Boost 350 V2','Yeezy Powerphase','Yeezy Boost 700','Yeezy 500'].to_a.sample, color:['white','black','red','ochre','beige'].to_a.sample, size:rand(40...45))
end

10.times do
  Shop.create(user_id: User.all.sample.id, sneaker_id: Sneaker.all.sample.id)
end

puts 'seeded'
