# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

User.create(email: 'henry@martin.com', password: '424242', first_name: 'Henry', last_name: 'Martin', phone: '0697042328', office_address: '0 rue Crespin du Gast', office_info: 'Code: 4210', photo: "https://upload.wikimedia.org/wikipedia/en/thumb/8/87/Cox-season9.jpg/250px-Cox-season9.jpg")



# Patient.create(first_name: 'Jane', last_name: 'Doe', phone: '6050990840',
#   job_title: 'Dead', address: '1 rue Crespin du Gast', city: 'Paris',
#   zipcode: '75011', date_of_birth: '26/09/1987', gender: 'female', email: 'jane.doe@gmail.com',
#   user_id: 1)

fn_array = ['Gabriel', 'Emma', 'Louis', 'Raphaël', 'Jules', 'Adam', 'Lucas', 'Léo', 'Louise', 'Jade', 'Hugo', 'Arthur', 'Nathan', 'Alice', 'Liam', 'Ethan', 'Paul', 'Chloé', 'Lina', 'Mila', 'Tom', 'Léa', 'Manon', 'Sacha', 'Noah', 'Gabin', 'Nolan', 'Enzo', 'Mohamed', 'Rose', 'Anna', 'Inès', 'Aaron', 'Camille', 'Lola', 'Timéo', 'Théo', 'Ambre', 'Léna', 'Zoé', 'Mathis', 'Juliette', 'Axel', 'Julia', 'Victor', 'Lou', 'Antoine', 'Valentin', 'Sarah', 'Lucie']
ln_array = ['Martin', 'Legrand', 'Bernard', 'Garnier', 'Dubois', 'Faure', 'Thomas', 'Rousseau', 'Robert', 'Blanc', 'Richard', 'Guerin', 'Petit', 'Muller', 'Durand', 'Henry', 'Leroy', 'Roussel', 'Moreau', 'Nicolas', 'Simon', 'Perrin', 'Laurent', 'Morin', 'Lefebvre', 'Mathieu', 'Michel', 'Clement', 'Garcia', 'Gauthier', 'David', 'Dumont', 'Bertrand', 'Lopez', 'Roux', 'Fontaine', 'Vincent', 'Chevalier', 'Fournier', 'Robin', 'Morel', 'Masson', 'Girard', 'Sanchez', 'Andre', 'Gerard', 'Lefevre', 'Nguyen', 'Mercier', 'Boyer', 'Dupont', 'Denis', 'Lambert', 'Lemaire', 'Bonnet', 'Duval', 'Francois', 'Joly', 'Martinez', 'Gautier']
160.times do
  # @fname = :first_name
  patient = Patient.new(
    first_name: fn_array.sample,
    last_name: ln_array.sample,
    phone: Faker::PhoneNumber.phone_number,
    job_title: Faker::Job.title,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    date_of_birth: Faker::Date.birthday(18, 65),
    gender: Faker::Gender.binary_type,
    email: Faker::Internet.free_email,
    user_id: 1
  )
  patient.save!
end

# Consultation.create(patient_id: 1, start_time: '14h30',
#   end_time: '15h30', consultation_type: 'Operation')
time_array = [8..20]
type_array = ["First meeting", "Operation", "Consultation"]
status_array = ["Upcoming", "Past"]
i = 1
53.times do
  consultation = Consultation.new(
    patient_id: i,
    status: status_array.sample,
    start_time: Faker::Time.forward(7, :morning),
    end_time: Faker::Time.forward(7, :morning),
    consultation_type: type_array.sample,
    required_documents: Faker::Lorem.paragraph_by_chars,
    patient_complain: Faker::Lorem.paragraph_by_chars,
    diagnostic: Faker::Lorem.paragraph_by_chars,
    care_plan: Faker::Lorem.paragraph_by_chars,
    prescription: Faker::Lorem.paragraph_by_chars,
    patient_note_attachment: Faker::Books::Dune.quote
    )
    i += 1
  consultation.save!
end


i = 54
53.times do
  consultation = Consultation.new(
    patient_id: i,
    status: status_array.sample,
    start_time: Faker::Time.forward(7, :afternoon),
    end_time: Faker::Time.forward(7, :afternoon),
    consultation_type: type_array.sample,
    required_documents: Faker::Lorem.paragraph_by_chars,
    patient_complain: Faker::Lorem.paragraph_by_chars,
    diagnostic: Faker::Lorem.paragraph_by_chars,
    care_plan: Faker::Lorem.paragraph_by_chars,
    prescription: Faker::Lorem.paragraph_by_chars,
    note_patient: Faker::Lorem.paragraph_by_chars,
    patient_note_attachment: Faker::Books::Dune.quote
    )
    i += 1
  consultation.save!
end

i = 108
53.times do
  consultation = Consultation.new(
    patient_id: i,
    status: status_array.sample,
    start_time: Faker::Time.forward(7, :evening),
    end_time: Faker::Time.forward(7, :evening),
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

a = Patient.new(user_id: 1, first_name: 'Raphaël', last_name: 'Lenfant', phone: '06 67 76 97 19', job_title: 'Public servent', address: '76 rue de moscou', city: 'Paris', zipcode: '75008', date_of_birth: '04/06/1980', gender: 'Male', email: 'henry.martin@gmail.com')
a.save!
b = Consultation.new(patient_id: a.id, status: 'Past', start_time: '06/09/2018 08:30PM', end_time: '06/09/2018 09:00PM', consultation_type: "First meeting", patient_complain: "So I’ve been dealing with insomnie for a while, it hasn’t been a massive issue, because I’m on break from school but it’s increasing my circadian rhythm pretty badly. I’ve been able to deal with it for a good while and been pulling all nighters without sleeping and going to sleep early to kind of course correct if that makes sense.", diagnostic: "Chronic insomnie caused by stress: Concerns about work, school, health, finances or family can keep your mind active at night, making it difficult to sleep.", care_plan: "Changing your sleep habits and addressing any issues that may be associated with insomnie, such as stress, medical conditions or medications, can restore restful sleep for many people.", prescription: "Stimulus control therapy. This method helps remove factors that condition your mind to resist sleep. For example, you might be coached to set a consistent bedtime and wake time and avoid naps, use the bed only for sleep and sex, and leave the bedroom if you can't go to sleep within 20 minutes, only returning when you're sleepy.
Relaxation techniques. Progressive muscle relaxation, biofeedback and breathing exercises are ways to reduce anxiety at bedtime. Practicing these techniques can help you control your breathing, heart rate, muscle tension and mood so that you can relax.
Sleep restriction. This therapy decreases the time you spend in bed and avoids daytime naps, causing partial sleep deprivation, which makes you more tired the next night. Once your sleep has improved, your time in bed is gradually increased.
Remaining passively awake. Also called paradoxical intention, this therapy for learned insomnie is aimed at reducing the worry and anxiety about being able to get to sleep by getting in bed and trying to stay awake rather than expecting to fall asleep.
Light therapy. If you fall asleep too early and then awaken too early, you can use light to push back your internal clock. You can go outside during times of the year when it's light outside in the evenings, or you can use a light box. Talk to your doctor about recommendations.", note_patient: 'If a change in habbit does not help, give drugs.')
b.save!
c = Consultation.new(patient_id: a.id, status: 'Past', start_time: '18/02/2019 08:30PM', end_time: '18/02/2019 09:00PM', consultation_type: "Consultation", patient_complain:"I still barely sleep. I tried to change my habbits but the results are the same. I want to ponder new medicines as alternatives", diagnostic: 'A change of habbits was not a solution. It is a chronic case needing more attention.', care_plan: 'Let us put the patient under observation for one night at the sleeping center', prescription: "Simply contact Healthcare Coordination, and we’ll help you find a new primary care physician or specialist. You can also make an appointment with your current doctor. Do it all with one call: 01 43 43 27 27", note_patient: '')
c.save!
d = Consultation.new(patient_id: a.id, status: 'Upcoming', start_time: '14/06/2019 09:00AM', end_time: '14/06/2019 09:30AM', consultation_type: "Consultation")
d.save!
e = Email.new(consultation_id: b.id, title: 'Information after our first meeting', content: b.prescription)
e.save!
f = Email.new(consultation_id: c.id, title: 'Feedback from our consultation', content: c.prescription)
f.save!
g = Email.new(consultation_id: d.id, title: 'Taking your meeting at the sleeping center', content: d.prescription)
g.save!

Consultation.all.each do |c|
  if c.start_time.day == 16
    c.destroy
  end
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
