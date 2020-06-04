class StudentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :middle_initial,
    :age, :grade_level, :email, :about, :enrolled, :statues
end
