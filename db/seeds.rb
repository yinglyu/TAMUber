User.create!([
  {email: "admin@tamu.edu", encrypted_password: "$2a$11$mP6M8u.Q/d8JXJ21Drq3UevuW26/1Mutz.7jU3qvWx1sWkj2mK6oW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "admin", admin: false, license: nil, tel: nil, address: nil, confirmation_token: "xSVwSWPpGFREbAHN9hp3", confirmed_at: "2019-12-10 21:50:01", confirmation_sent_at: "2019-12-10 21:49:40", unconfirmed_email: nil}
])
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
