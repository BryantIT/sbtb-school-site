class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :middle_initial, :grade_level, :email,
    :about, :status, :role
    has_many :schedules, serializer: ScheduleSerializer
    has_many :newsletters, serializer: NewsletterSerializer
end
