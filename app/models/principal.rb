class Principal < ApplicationRecord
  has_secure_password
  has_many :teachers
  has_many :students, through: :teachers
end
