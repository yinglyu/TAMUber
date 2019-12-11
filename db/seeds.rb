

Driver.create!([
  {name: "Jeff Chang", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Jack Wu", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Amy Chien", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Joe Chou", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Grace Yang", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Sean Chen", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Jeremy Lin", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Stephen Harden", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Scottie Payton", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil},
  {name: "Jerry  Griffin", isAvailable: true, Email: nil, UIN: nil, license: nil, tel: nil, address: nil}
])
Event.create!([
  {title: "Sean Chen", start: "2019-12-11 07:00:00", end: "2019-12-11 10:30:00", driver_id: 6, frequency: "once"},
  {title: "Grace Yang", start: "2019-12-11 10:00:00", end: "2019-12-11 13:30:00", driver_id: 5, frequency: "biweekly"},
  {title: "Jeff Chang", start: "2019-12-20 07:30:00", end: "2019-12-20 14:00:00", driver_id: 1, frequency: "weekly"},
  {title: "Amy Chien", start: "2019-12-11 12:00:00", end: "2019-12-11 16:00:00", driver_id: 3, frequency: "once"},
  {title: "Scottie Payton", start: "2019-12-11 14:00:00", end: "2019-12-11 18:30:00", driver_id: 9, frequency: "once"}
])
Vehicle.create!([
  {name: "LBY0920", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "LGL2724", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "LBJ7777", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "DAV2483", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "LJX5347", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "MVC3948", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "CRU2948", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "LKK2431", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "LAG8787", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil},
  {name: "GTA9992", isAvailable: true, tire_pressure: nil, battery: nil, occupancy: nil}
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


connection = ActiveRecord::Base.connection();
# Execute a sql statement
connection.execute("INSERT INTO users (email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, name, admin, license, tel, address, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) VALUES ('admin@tamu.edu', '$2a$11$mP6M8u.Q/d8JXJ21Drq3UevuW26/1Mutz.7jU3qvWx1sWkj2mK6oW', null, null, null, '2019-12-10 21:49:40.395501', '2019-12-10 21:50:01.816273', 'admin', 0, null, null, null, 'xSVwSWPpGFREbAHN9hp3', '2019-12-10 21:50:01.815552', '2019-12-10 21:49:40.395610', null);")


