# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Speciality.destroy_all

cities_array = [{name: "Paris"}, {name: "Lyon"}, {name: "Bordeaux"}]

cities_array.each_with_index do |city, index|
  City.create(city)
  puts "#{index + 1} cities created."
end

specialities_array = [{name: "Monstrologist"}, {name: "Cardiologist"}]

specialities_array.each_with_index do |speciality, index|
  Speciality.create(speciality)
  puts "#{index + 1} specialities created."
end

doctors_array = [{first_name: "Ian", last_name: "Jekyll", zip_code: "69000", city: City.all.sample}, {first_name: "Salma", last_name: "Johnburg", zip_code: "69100", city: City.all.sample}]
patients_array = [{first_name: "Matt", last_name: "Degré", city: City.all.sample}, {first_name: "Ken", last_name: "Le Survivant", city: City.all.sample}, {first_name: "Tortue", last_name: "Géniale", city: City.all.sample}]



doctors_array.each_with_index do |doctor, index|
  Doctor.create(doctor)
  # doctor.update(city: City.all.sample)
  puts "#{index + 1} doctors created."
end

patients_array.each_with_index do |patient, index|
  Patient.create(patient)
  # patient.update(city: City.all.sample)
  puts "#{index + 1} patients created."
end

docs = Doctor.all

docs.each do |doctor|
  doctor.specialities = Speciality.all
  puts "Specialities assigned to #{doctor.first_name} #{doctor.last_name}"
end

Appointment.create(date: Time.now, doctor: Doctor.all.last, patient: Patient.all.last, city: City.all.sample)
puts "Rendez-vous programmé !"

