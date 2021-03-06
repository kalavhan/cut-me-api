# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

barber1 = Barber.create(name: 'Joey', last_name: 'Tribbiany', role: 'Master Barber', image: 'https://i.ibb.co/mysq8vD/barber1.png')
barber1.services.create(title: 'Cutting and trimming hair', price: 24.00)
barber1.services.create(title: 'Shavign and trimming beards', price: 12.00)
barber1.services.create(title: 'Dying hair', price: 52.00)

barber2 = Barber.create(name: 'Phoebe', last_name: 'Buffay', role: 'Barber Apprentice', image: 'https://i.ibb.co/gDfpML4/barber2.png')
barber2.services.create(title: 'Cutting and trimming hair', price: 16.00)

barber3 = Barber.create(name: 'Monica', last_name: 'Geller', role: 'Master Barber', image: 'https://i.ibb.co/nPvmnzD/barber3.png')
barber3.services.create(title: 'Cutting and trimming hair', price: 26.50)
barber3.services.create(title: 'Dying hair', price: 45.00)

barber4 = Barber.create(name: 'Rachel', last_name: 'Green', role: 'Master Barber', image: 'https://i.ibb.co/pQtC9Dn/baber4.png')
barber4.services.create(title: 'Cutting and trimming hair', price: 23.50)
barber4.services.create(title: 'Shavign and trimming beards', price: 14.00)
barber4.services.create(title: 'Dying hair', price: 50.00)
barber4.services.create(title: 'Style designer', price: 120.00)


barber5 = Barber.create(name: 'Ross', last_name: 'Geller', role: 'Barber Apprentice', image: 'https://i.ibb.co/smNtFsb/barber5.png')
barber5.services.create(title: 'Shavign and trimming beards', price: 10.00)