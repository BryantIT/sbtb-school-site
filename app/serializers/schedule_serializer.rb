class ScheduleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start, :end, :description, :year
  belongs_to :user
end
