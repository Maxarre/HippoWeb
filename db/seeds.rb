# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

User.create(email: 'doctor@cox.com', password: '424242', first_name: 'Perry', last_name: 'Cox', phone: '0697042328', office_address: '0 rue Crespin du Gast', office_info: 'Code: 4210', photo: "https://upload.wikimedia.org/wikipedia/en/thumb/8/87/Cox-season9.jpg/250px-Cox-season9.jpg")


# Patient.create(first_name: 'Jane', last_name: 'Doe', phone: '6050990840',
#   job_title: 'Dead', address: '1 rue Crespin du Gast', city: 'Paris',
#   zipcode: '75011', date_of_birth: '26/09/1987', gender: 'female', email: 'jane.doe@gmail.com',
#   user_id: 1)

20.times do
  # @fname = :first_name
  patient = Patient.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    job_title: Faker::Job.title,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    date_of_birth: Faker::Date.birthday(18, 65),
    gender: Faker::Gender.binary_type,
    email: Faker::Internet.free_email,
    user_id: 1,
  )
  patient.save!
end


# Consultation.create(patient_id: 1, start_time: '14h30',
#   end_time: '15h30', consultation_type: 'Operation')

type_array = ["First meeting", "Operation", "Consultation"]
status_array = ["Upcoming", "Passed"]
i = 1
10.times do
  consultation = Consultation.new(
    patient_id: i,
    status: status_array.sample,
    start_time: Faker::Time.forward(5, :morning),
    end_time: Faker::Time.forward(5, :evening),
    consultation_type: type_array.sample,
    required_documents: Faker::Lorem.paragraph_by_chars,
    patient_complain: Faker::Lorem.paragraph_by_chars,
    diagnostic: Faker::Lorem.paragraph_by_chars,
    care_plan: Faker::Lorem.paragraph_by_chars,
    prescription: Faker::Lorem.paragraph_by_chars,
    note_patient: Faker::Lorem.paragraph_by_chars,
    patient_note_attachment: Faker::Books::Dune.quote,
    )
    i += 1
  consultation.save!
end
