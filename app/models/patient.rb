class Patient < ApplicationRecord
  belongs_to :user
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :date_of_birth, presence: true
  # validates :gender, presence: true
  # validates :address, presence: true
  # validates :city, presence: true
  # validates :zipcode, presence: true
  # validates :job_title, presence: true
  # validates :email, presence: true
  # validates :phone, presence: true
end
