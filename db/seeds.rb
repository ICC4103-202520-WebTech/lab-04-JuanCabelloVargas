puts "Initializing data loading process"

puts "Loading guests in table"

Guest.create!([
  { first_name: "Andres", last_name: "Howard", email: "aihoward@miuandes.cl", phone: "900001111", document_id: "99999999k" },
  { first_name: "Elvis", last_name: "Tec", email: "test@test.com", phone: "912345678", document_id: "141414142" }
])

puts "Loading Rooms"

rooms = Room.create!([
  { number: "101", room_type: 1, price: 1000, status: 1 },
  { number: "201", room_type: 2, price: 2000, status: 2 },
  { number: "301", room_type: 3, price: 3000, status: 3 }
])

puts "Loading Services"

services = Service.create!([
  { name: "Laundry", price: 20, is_active: true },
  { name: "Spa", price: 15, is_active: false }
])

puts "Loading Reservations"

Reservation.create!([
  { code: "code1", guest_id: 1, room_id: 1, check_in: Date.new(2025, 9, 1), check_out: Date.new(2025, 9, 15), status: 1, adults: 1, children: 2 },
  { code: "code2", guest_id: 2, room_id: 3, check_in: Date.new(1995, 12, 21), check_out: Date.new(2025, 12, 31), status: 1, adults: 1 }
])

puts "Loading ServiceUsages"

ServiceUsage.create!([
  { reservation_id: 1, service_id: 1, quantity: 2, used_at: DateTime.new(2025, 9, 10, 10, 0), note: "2 Shirts and 4 pants" },
  { reservation_id: 2, service_id: 2, quantity: 1, used_at: DateTime.new(2004, 10, 12, 5), note: "1 hour session" }
])

puts "Loading Invoices"
nights_subtotal1 = 15 * rooms.first.price
services_subtotal1 = services.first.price * 2
tax1 = (nights_subtotal1 + services_subtotal1)*19/100
total1 = nights_subtotal1 + services_subtotal1 + tax1

nights_subtotal2 = 10968 * rooms.last.price
services_subtotal2 = services.last.price
tax2 = (nights_subtotal2 + services_subtotal2)*19/100
total2 = nights_subtotal2 + services_subtotal2 + tax2

Invoice.create!([
  { reservation_id: 1,
    nights_subtotal: nights_subtotal1,
    services_subtotal: services_subtotal1,
    tax: tax1,
    total: total1,
    issued_at: DateTime.new(2025, 9, 15, 5, 15),
    status: 1 },

  { reservation_id: 2,
    nights_subtotal: nights_subtotal2,
    services_subtotal: services_subtotal2,
    tax: tax2,
    total: total2,
    issued_at: DateTime.new(2025, 12, 31, 12, 0), status: 1 }
  ])
