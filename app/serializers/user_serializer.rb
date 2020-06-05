class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :middle_initial, :grade_level, :email,
    :about, :status, :role
end
