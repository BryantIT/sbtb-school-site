class PrincipalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :middle_initial, :email, :about, :role
end
