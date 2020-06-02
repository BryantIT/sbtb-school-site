class Student < ApplicationRecord
  has_secure_password
  belongs_to :parent
  belongs_to :teacher
end
