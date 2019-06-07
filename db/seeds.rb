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

80.times do
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

p '20 patients created'

# Consultation.create(patient_id: 1, start_time: '14h30',
#   end_time: '15h30', consultation_type: 'Operation')

type_array = ["First meeting", "Operation", "Consultation"]
status_array = ["Upcoming", "Past"]
i = 1
80.times do
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



# 10.times do
#   consultation = Consultation.new(
#     patient_id: i,
#     status: status_array.sample,
#     start_time: Faker::Time.forward(5, :morning),
#     end_time: Faker::Time.forward(5, :evening),
#     consultation_type: type_array.sample,
#     required_documents: Faker::Lorem.paragraph_by_chars,
#     patient_complain: Faker::Lorem.paragraph_by_chars,
#     diagnostic: Faker::Lorem.paragraph_by_chars,
#     care_plan: Faker::Lorem.paragraph_by_chars,
#     prescription: Faker::Lorem.paragraph_by_chars,
#     note_patient: Faker::Lorem.paragraph_by_chars,
#     patient_note_attachment: Faker::Books::Dune.quote,
#     )
#     i += 1
#   consultation.save!
# end


a = Patient.new(user_id: 1, first_name: 'John', last_name: 'Doe', phone: '06 67 76 97 19', job_title: 'Public servent', address: '76 rue de moscou', city: 'Paris', zipcode: '75008', date_of_birth: '04/06/1980', gender: 'Male', email: 'john.doe@gmail.com')
a.save!
b = Consultation.new(patient_id: a.id, status: 'Past', start_time: '06/09/2018 08:30PM', end_time: '06/09/2018 09:00PM', consultation_type: "First meeting", patient_complain: "So I’ve been dealing with insomnia for a while, it hasn’t been a massive issue, because I’m on break from school but it’s increasing my circadian rhythm pretty badly. I’ve been able to deal with it for a good while and been pulling all nighters without sleeping and going to sleep early to kind of course correct if that makes sense.", diagnostic: "Chronic insomnia caused by stress: Concerns about work, school, health, finances or family can keep your mind active at night, making it difficult to sleep.", care_plan: "Changing your sleep habits and addressing any issues that may be associated with insomnia, such as stress, medical conditions or medications, can restore restful sleep for many people.", prescription: "Stimulus control therapy. This method helps remove factors that condition your mind to resist sleep. For example, you might be coached to set a consistent bedtime and wake time and avoid naps, use the bed only for sleep and sex, and leave the bedroom if you can't go to sleep within 20 minutes, only returning when you're sleepy.
Relaxation techniques. Progressive muscle relaxation, biofeedback and breathing exercises are ways to reduce anxiety at bedtime. Practicing these techniques can help you control your breathing, heart rate, muscle tension and mood so that you can relax.
Sleep restriction. This therapy decreases the time you spend in bed and avoids daytime naps, causing partial sleep deprivation, which makes you more tired the next night. Once your sleep has improved, your time in bed is gradually increased.
Remaining passively awake. Also called paradoxical intention, this therapy for learned insomnia is aimed at reducing the worry and anxiety about being able to get to sleep by getting in bed and trying to stay awake rather than expecting to fall asleep.
Light therapy. If you fall asleep too early and then awaken too early, you can use light to push back your internal clock. You can go outside during times of the year when it's light outside in the evenings, or you can use a light box. Talk to your doctor about recommendations.", note_patient: 'If a change in habbit does not help, give drugs.')
b.save!
c = Consultation.new(patient_id: a.id, status: 'Past', start_time: '18/02/2019 08:30PM', end_time: '18/02/2019 09:00PM', consultation_type: "Consultation", patient_complain:"I still barely sleep. I tried to change my habbits but the results are the same. I want to ponder new medicines as alternatives", diagnostic: 'A change of habbits was not a solution. It is a chronic case needing more attention.', care_plan: 'Let us put the patient under observation for one night at the sleeping center', prescription: "Simply contact Healthcare Coordination, and we’ll help you find a new primary care physician or specialist. You can also make an appointment with your current doctor. Do it all with one call: 01 43 43 27 27", note_patient: '')
c.save!
d = Consultation.new(patient_id: a.id, status: 'Upcoming', start_time: '07/06/2019 06:30PM', end_time: '07/06/2019 07:00PM', consultation_type: "Consultation", note_patient: 'Dr. Dorian sent us the results.')
d.save!
e = Email.new(consultation_id: b.id, title: 'Information after our first meeting', content: b.prescription)
e.save!
f = Email.new(consultation_id: b.id, title: 'Feedback from our consultation', content: b.prescription)
f.save!
g = Email.new(consultation_id: b.id, title: 'Taking your meeting at the sleeping center', content: b.prescription)
g.save!
Collapse




Message Input
