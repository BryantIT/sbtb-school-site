class User < ApplicationRecord
  enum role: [:standard, :teacher, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end
end
