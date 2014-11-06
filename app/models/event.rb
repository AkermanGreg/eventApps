class Event
  include Mongoid::Document
  include Geocoder::Model::Mongoid
geocoded_by :full_address               # can also be an IP address
after_validation :geocode       # auto-fetch coordinates    # auto-fetch coordinates

  
  field :title, type: String
  field :date, type: String
  field :time, type: String
  field :full_address, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :desc, type: String
  field :latitude, type: Float 
  field :longitude, type: Float
  field :coordinates, type: Array

  belongs_to :user

  # geocoded_by :full_address
  # after_validation :geocode

  # validates :address, :city, :state, :zip, presence: true



def full_address
    return "#{address}, #{city}, #{state}, #{zip}"
end
end