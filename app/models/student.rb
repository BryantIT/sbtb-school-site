class Student < ApplicationRecord
  has_secure_password
  belongs_to :parent
  has_many :years
  has_many :teachers, through: :years
  has_many :schedules
end
