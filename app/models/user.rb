class User < ApplicationRecord
  enum role: [:standard, :other, :teacher, :admin]
  has_secure_password

  has_many :schedules
  has_many :relationships
  has_many :newsletters

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end

end
