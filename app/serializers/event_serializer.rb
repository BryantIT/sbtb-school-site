class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :body, :link
end
