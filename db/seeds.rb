# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'doctor@cox.com', password: '424242', first_name: 'Perry', last_name: 'Cox', phone: '0697042328', office_address: '0 rue Crespin du Gast', office_info: 'Code: 4210', photo: "Cox.jpg")
Patient.create(first_name: 'Jane', last_name: 'Doe', phone: '6050990840', job_title: 'Dead', address: '1 rue Crespin du Gast', city: 'Paris', zipcode: '75011', date_of_birth: '26/09/1987', gender: 'female', email: 'jane.doe@gmail.com', user_id: 1)
Consultation.create(patient_id: 1, start_time: '14h30', end_time: '15h30', consultation_type: 'Operation')
