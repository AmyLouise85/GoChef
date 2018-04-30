# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [
   {email: 'gordonramsey@gmail.com', password: 'pass123', name: 'Gordon Ramsey', location_lat: 51.512640,location_lon: -0.090390, address:'', bio: 'Swears a lot and has numerous TV shows in both UK and America', distance_to_travel: 100, role: 0},
   {email: 'deliasmith@gmail.com', password: 'pass123', name: 'Delia Smith', location_lat: 51.512427,location_lon: -0.164376,  address:'', bio: 'Known for teaching basic cookery skills in a no-nonsense style', role: 0, distance_to_travel: 130},
   {email: 'ainsleyharriet@gmail.com', password: 'pass123', name: 'Ainsley Harriet', location_lat: 51.485949,location_lon: -0.106183,  address:'', bio: 'Presenter for many BBC cooking shows', role: 0, distance_to_travel: 50},
   {email: 'bella@dogchow.com', password: 'pass123', name: 'Bella Marusiak', location_lat: 51.536772, location_lon: -0.062896,  address:'', bio: 'Not a fussy eater but will do many tricks for a tasty treat', role: 0, distance_to_travel: 30},
   {email: 'vik@indianfood4u.com', password: 'pass123', name: 'Vikram Singh', location_lat: 51.536233, location_lon: -0.021151,  address:'', bio: 'Not a TV personality- just really loves Indian food', role: 0, distance_to_travel: 20},
   {email: 'jamie@oliver.com', password: 'pass123', name: 'Jamie Oliver', location_lat: 51.535739, location_lon: -0.077700,  address:'', bio: 'Known for his British cuisine- just wants kids to eat healthy', role: 0, distance_to_travel: 20},
   {email: 'zoe@wegotcoders.com', password: 'pass123', name: 'Zoe Flash', location_lat: 51.755733, location_lon: -0.010177,  address:'', bio: 'Probably loves the flash more than she loves cooking but makes a mean brownie', role: 0, distance_to_travel: 50},
   {email: 'nigella@nigellalawson.com', password: 'pass123', name: 'Nigella Lawson', location_lat: 17.172744, location_lon: -3.142876,  address:'', bio: 'Food writer and journalist', role: 0, distance_to_travel: 10},
   {email: 'amylu@princessoftheworld.com', password: 'pass123', name: 'Amy Lu', location_lat: 51.577414, location_lon: -0.017168,  address:'', bio: 'Obsessed with cheese, pretends to be t-rex, and likes to ride guinea pigs dressed like Hello Kitty.', role: 1, distance_to_travel: 50},
   {email: 'phatguy@eatsallday.fud', password: 'pass123', name: 'Userman Likestoeat', location_lat: 17.17564, location_lon: -3.52376,  address:'', bio: 'Eats what he finds', role: 1, distance_to_travel: 200}
]

users = User.create!(users)

Review.create!(rating: 4, review: 'Bella made a very fine biscuit, but I deducted a point due to finding hair in the mix.', chef: users[3], customer: users[9])
Review.create!(rating: 5, review: 'Some of the best spacecakes Ive had!', chef: users[6], customer: users[8])
Review.create!(rating: 5, review: 'Some really tight sushi rolls.', chef: users[6], customer: users[8])
Review.create!(rating: 5, review: 'Her service was impeccable and her meals were delicious.', chef: users[1], customer: users[9])
Review.create!(rating: 2, review: 'She showed up late and reeked of last nights party.', chef: users[1], customer: users[8])
Review.create!(rating: 1, review: 'She did not deliver the agreed upon service, and retroactively billed me for services she did not provide.', chef: users[1], customer: users[8])
Review.create!(rating: 3, review: 'She redeemed herself to me a bit this time with her sweet, sweet canapes', chef: users[1], customer: users[8])
Review.create!(rating: 2, review: 'She never turned up, but sent us a party sub instead. It was pretty tasty!', chef: users[7], customer: users[8])
Review.create!(rating: 1, review: 'What a jackass.', chef: users[0], customer: users[9])
Review.create!(rating: 1, review: 'Ive never heard so much rude language at a childs birthday party before.', chef: users[0], customer: users[8])
Review.create!(rating: 3, review: 'Mediocre.', chef: users[2], customer: users[9])
Review.create!(rating: 4, review: 'Could have used a bit more salt.', chef: users[5], customer: users[8])
Review.create!(rating: 5, review: 'He is a very handsome guy. Im sold!', chef: users[5], customer: users[9])
Review.create!(rating: 5, review: 'Gimme fud.', chef: users[7], customer: users[9])


skills = [
    {name: "Chinese"},
    {name: "Italian"},
    {name: "Japanese"},
    {name: "Mexican"},
    {name: "Sushi"},
    {name: "Indian"},
    {name: "Soup"},
    {name: "Vegan"},
    {name: "Vegetarian"},
    {name: "Thai"},
    {name: "Raw Food"},
    {name: "Birthday Parties"},
    {name: "Weddings"},
    {name: "Formal"},
    {name: "Casual"},
    {name: "Silver Service"},
    {name: "Sandwiches"},
    {name: "Buffets"}
]

Skill.create!(skills)

User.all.each do |user|
    x = Skill.all.shuffle
    random_skills = [x[0],x[1],x[2]]
    user.skills << random_skills
end



