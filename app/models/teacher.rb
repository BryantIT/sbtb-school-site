class Teacher < ApplicationRecord
  has_secure_password
  has_many :years
  has_many :students, through: :years
  has_many :parents, through: :students
end
