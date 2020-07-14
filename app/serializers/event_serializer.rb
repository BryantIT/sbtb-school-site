class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start, :end, :eventClasses, :title, :description
end
