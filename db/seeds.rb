require 'faker'

puts "🌱 Nettoyage de la base..."
Appointment.destroy_all
DoctorSpecialty.destroy_all
Specialty.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all

puts "🌱 Création des villes..."
cities = []
5.times do
  cities << City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

puts "🌱 Création des spécialités..."
specialties = []
10.times do
  specialties << Specialty.create!(
    name: Faker::Job.field
  )
end

puts "🌱 Création des docteurs..."
10.times do
  Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: cities.sample
  )
end

puts "🌱 Lien des docteurs avec les spécialités..."
Doctor.all.each do |doctor|
  doctor.specialties << specialties.sample(rand(1..3))
end

puts "🌱 Création des patients..."
10.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: cities.sample
  )
end

puts "🌱 Création des rendez-vous..."
20.times do
  Appointment.create!(
    date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    city: cities.sample
  )
end

puts "✅ Seed terminé avec succès !"