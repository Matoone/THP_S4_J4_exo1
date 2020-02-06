class Speciality < ApplicationRecord
  has_and_belongs_to_many :doctors, through: :doctors_specialities
end
