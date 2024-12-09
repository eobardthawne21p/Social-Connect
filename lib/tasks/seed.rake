namespace :db do
  desc "Seed the database"
  task seed_production: :environment do
    if Rails.env.production?
      load Rails.root.join("db/seeds.rb")
      puts "Database seeded successfully!"
    else
      puts "Seeding only allowed in production environment."
    end
  end
end
