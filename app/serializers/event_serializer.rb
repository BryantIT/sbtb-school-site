class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :end, :start, :allDay, :resource, :description
end
