class Year < ApplicationRecord
  has_many :teachers
  has_many :students
end