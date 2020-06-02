class Parent < ApplicationRecord
  has_secure_password
  has_many :students
  has_many :teachers, through: :years
end
