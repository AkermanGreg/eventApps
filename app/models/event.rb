class Event
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :title, type: String
  field :date, type: Date
  field :time, type: Time
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :desc, type: String
end
