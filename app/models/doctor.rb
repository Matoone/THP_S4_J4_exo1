class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_and_belongs_to_many :specialities, through: :doctors_specialities
  belongs_to :city
end
