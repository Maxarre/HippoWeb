class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :emails
end
