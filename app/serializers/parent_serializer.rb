class ParentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :middle_initial, :email, :about,
   :student_id
   has_many :students, serializer: StudentSerializer
end
