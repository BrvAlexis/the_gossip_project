# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Création de villes
10.times do
    City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  end
  
  # Création d'utilisateurs
  10.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph,
      email: Faker::Internet.email,
      age: Faker::Number.between(from: 18, to: 99),
      city: City.all.sample
    )
  end
  
  # Création de gossips
  20.times do
    Gossip.create(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
      user: User.all.sample
    )
  end
  
  # Création de tags
10.times do
    Tag.create(title: "##{Faker::Lorem.word}")
  end
  
  # Association des gossips avec des tags
  Gossip.all.each do |gossip|
    rand(1..3).times do
      gossip.tags << Tag.all.sample
    end
  end
  
  # Création de messages privés
  5.times do
    sender = User.all.sample
    recipients = User.all.sample(rand(1..5))
  
    pm = PrivateMessage.create(
      content: Faker::Lorem.paragraph,
      sender: sender
    )
  
    recipients.each do |recipient|
      pm.users << recipient
    end
  end
  