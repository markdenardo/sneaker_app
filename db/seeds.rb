
Sneaker.destroy_all
User.destroy_all
Shop.destroy_all

50.times do
  User.create(name: Faker::Sports::Basketball.player)
end

s1 = Sneaker.create(style: "rumba", color: "white", size: 44)
s2 = Sneaker.create(style: "rumba", color: "black", size: 44)
s3 = Sneaker.create(style: "track", color: "white", size: 44)
s4 = Sneaker.create(style: "track", color: "black", size: 44)
s5 = Sneaker.create(style: "court", color: "red", size: 44)
s6 = Sneaker.create(style: "court", color: "black", size: 44)
s7 = Sneaker.create(style: "court", color: "white", size: 44)
