class Principal < ApplicationRecord
  has_secure_password
  has_many :teachers
end
