# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


main_user = User.new
main_user.email = "test"
main_user.password = "test"
main_user.password_confirmation = "test"
main_user.save

16.times do |i|
  exp = Experience.new
  exp.title = "Puente Hidalgo"
  exp.description = "Lorem saturation point neural tower fluidity rifle render-farm BASE jump marketing towards pre- artisanal cardboard nodality boy chrome boat -space tanto assassin spook plastic man semiotics bridge dome cartel carbon singularity monofilament stimulate DIY katana vinyl decay sign fetishism sub-orbital office pistol digital sunglasses franchise human industrial grade into corporation claymore mine faded network long-chain hydrocarbons military-grade urban grenade dead footage assault concrete youtube gang euro-pop corrupted alcohol j-pop narrative tube ablative nano- sensory market silent numinous hacker"
  exp.date = "12 Marzo, 2012"
  exp.place = "Nuevo León"
  p = exp.photos.new 
  p.file = File.new("test/fixtures/puentes/#{i}.jpg")
  exp.save

end