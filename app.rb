require_relative 'user'
require_relative 'resource'
require_relative 'booking'

puts "=== CLI Lab Booking System Demo ===\n\n"

# 1. Create at least two users
puts "1. Creating users..."
user1 = User.new(id: 1, name: "Mahi", role: "student")
user2 = User.new(id: 2, name: "Alex", role: "assistant")
puts "   - #{user1.name} (#{user1.role})"
puts "   - #{user2.name} (#{user2.role})"

# 2. Create at least two resources
puts "\n2. Creating resources..."
microscope = Resource.new(id: 1, name: "Microscope", category: "lab")
laptop = Resource.new(id: 2, name: "Laptop", category: "electronics")
puts "   - #{microscope.name} (#{microscope.category})"
puts "   - #{laptop.name} (#{laptop.category})"

# 3. Create one valid booking
puts "\n3. Creating a valid booking..."
booking1 = Booking.new(user: user1, resource: microscope)
puts "   Success! #{user1.name} booked the #{microscope.name}"
puts "   Status: #{booking1.status}"

# 4. Try to create a conflicting booking
puts "\n4. Attempting conflicting booking..."
begin
  booking2 = Booking.new(user: user2, resource: microscope)
  puts "   ERROR: Should have been blocked!"
rescue BookingError => e
  puts "   Blocked! Error: #{e.message}"
end

# 5. Show that the conflict is blocked
puts "\n5. Conflict successfully prevented."

# 6. Cancel the first booking
puts "\n6. Cancelling the first booking..."
booking1.cancel
puts "   Booking status is now: #{booking1.status}"

# 7. Show that the resource becomes available again
puts "\n7. Checking if resource is available again..."
puts "   Microscope available? #{microscope.available?}"

# Bonus: Now the other user can book it
puts "\n8. Bonus: #{user2.name} books the now-available microscope..."
booking3 = Booking.new(user: user2, resource: microscope)
puts "   Success! Status: #{booking3.status}"

puts "\n=== Demo Complete ==="