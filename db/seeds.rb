# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Vehicle.create([
	{ name: "LBY0920" },
	{ name: "LGL2724" },
	{ name: "LBJ7777" },
	{ name: "DAV2483" },
	{ name: "LJX5347" },
	{ name: "MVC3948" },
	{ name: "CRU2948" },
	{ name: "LKK2431" },
	{ name: "LAG8787" },
	{ name: "GTA9992" },
])

Driver.create([
	{ name: "Jeff Chang" },
	{ name: "Jack Wu" },
	{ name: "Amy Chien" },
	{ name: "Joe Chou" },
	{ name: "Grace Yang" },
	{ name: "Sean Chen" },
	{ name: "Jeremy Lin" },
	{ name: "Stephen Harden" },
	{ name: "Scottie Payton" },
	{ name: "Jerry  Griffin" },
])


Onduty.create([
	{
		driverName: "Jeff Chang",
		plateNumber: "LBY0920",
		studentId: "123456",
		studentName: "HHH",
		vehicleLat: 30.61348,
		vehicleLng: -96.35539,
		isFinished: false
	},
	{
		driverName: "Jack Wu",
		plateNumber: "LGL2724",
		studentId: "654321",
		studentName: "rerorero",
		vehicleLat: 30.61368,
		vehicleLng: -96.35549,
		isFinished: false
	}
	]
)

