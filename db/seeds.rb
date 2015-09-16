# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
teams = Team.create([{ name: 'Seahawks', sport: 'Football'}, { name: 'Mariners', sport: 'Baseball'}, { name: 'Sounders FC', sport: 'Soccer'}, { name: 'Huskies', sport: 'Football'}])

russ = ['Seahawks', 'Russel Wilson', '3', 'Quarterback']
felix = ['Mariners', 'Felix Hernandez', '34', 'Starting Pitcher']
clint = ['Sounders FC', 'Clint Dempsey', '2', 'Striker/Midfielder']
jake = ['Huskies', 'Jake Browning', '3', 'Quarterback']

all_players = [russ, felix, clint, jake]

all_players.each do |player|
  Team.find_by(name: player[0]).players.build({ name: player[1], number: player[2], position: player[3] }).save
end
