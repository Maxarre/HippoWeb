class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :emails
  acts_as_taggable_on :tags
  TAGG_LIST = ['malade', 'moyen malade', 'pas malade', 'mytho']
end
