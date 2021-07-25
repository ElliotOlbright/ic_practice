class Mechanic < ApplicationRecord
  has_many :maintenences
  has_many :rides, through: :maintenences

  def self.average_years 
    average(:years_experience).to_i 
  end 

  def open_rides_by_thrill_rating
    rides.where(open: true).order(thrill: :desc)
  end 
end