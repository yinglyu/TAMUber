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


connection = ActiveRecord::Base.connection();
# Execute a sql statement
connection.execute("INSERT INTO users (email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, name, admin, license, tel, address, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) VALUES ('admin@tamu.edu', '$2a$11$mP6M8u.Q/d8JXJ21Drq3UevuW26/1Mutz.7jU3qvWx1sWkj2mK6oW', null, null, null, '2019-12-10 21:49:40.395501', '2019-12-10 21:50:01.816273', 'admin', 0, null, null, null, 'xSVwSWPpGFREbAHN9hp3', '2019-12-10 21:50:01.815552', '2019-12-10 21:49:40.395610', null);")