class Event
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  # include Geocoder::Model::Mongoid
  
  field :title, type: String
  field :date, type: String
  field :time, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :desc, type: String
   field :latitude, type: Float 
  field :longitude, type: Float

  belongs_to :user

  # geocoded_by :full_address
  # after_validation :geocode

  # validates :address, :city, :state, :zip, presence: true

end

def full_address
    return "#{address}, #{city}, #{state}, #{zip}"
end