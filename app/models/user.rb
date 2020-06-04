class User < ApplicationRecord
  def principal?
    self.role == "principal"
  end

  def teacher?
    self.role == "teacher"
  end

  def parent?
    self.role == "parent"
  end

  def student?
    self.role == "student"
  end
end
