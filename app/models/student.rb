class Student < ApplicationRecord
  has_secure_password
  belongs_to :parent
  has_many :klasses
  has_many :teachers, through: :klasses
end
