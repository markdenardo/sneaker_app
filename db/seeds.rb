
Sneaker.destroy_all
User.destroy_all
Shop.destroy_all

100.times do
  User.create(name: Faker::Sports::Basketball.player)
end

50.times do
  Sneaker.create(style:['Yeezy Boost 350','Yeezy 950','Yeezy 350 Cleat','Yeezy Boost 350 V2','Yeezy Powerphase','Yeezy Boost 700','Yeezy 500'].to_a.sample, color:['white','black','red','ochre','beige'].to_a.sample, size:[40...45].sample)
end

puts 'seeded'
