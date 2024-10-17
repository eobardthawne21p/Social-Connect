# Ensure admin exists
admin = User.find_or_create_by(username: "admin") do |user|
    user.name = "Admin"
    user.password = "admin123"
    user.password_confirmation = "admin123"
    user.birthday = Date.new(2000, 1, 1)
    user.role = "admin"
  end
  
  # Ensure moderator exists
  moderator = User.find_or_create_by(username: "moderator") do |user|
    user.name = "Moderator"
    user.password = "mod123"
    user.password_confirmation = "mod123"
    user.birthday = Date.new(1997, 3, 4)
    user.role = "moderator"
  end
  
  # Ensure regular user exists
  user = User.find_or_create_by(username: "user") do |user|
    user.name = "Regular User"
    user.password = "user123"
    user.password_confirmation = "user123"
    user.birthday = Date.new(2000, 4, 15)
    user.role = "user"
  end
  
  puts "Seeded users: #{User.count}"