class Teacher < ApplicationRecord
  has_secure_password
  has_many :klasses
  has_many :students, through: :klasses
  has_many :parents, through: :students
end
