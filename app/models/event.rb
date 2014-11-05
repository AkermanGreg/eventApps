class Event
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :title, type: String
  field :date, type: String
  field :time, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :desc, type: String

  belongs_to :user
end
