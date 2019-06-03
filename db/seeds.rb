# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'doctor@cox.com', encrypted_password: '4242', first_name: 'Perry', last_name: 'Cox', phone: '0697042328', office_address: '0 rue Crespin du Gast', office_info: 'Code: 4210')
Patient.create!(first_name: 'Jane', last_name: 'Doe', phone: '6050990840', job_title: 'Dead', address: '1 rue Crespin du Gast', date_of_birth: '26/09/1987', gender: 'female', email: 'jane.doe@gmail.com')
