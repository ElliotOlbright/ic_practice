require 'rails_helper' 

RSpec.describe Mechanic do 
  describe 'relationships' do 
    it {should have_many :maintenences}
    it {should have_many(:rides).through(:maintenences)} 
  end 

  describe 'methods' do 
    describe '::average_years' do 
      it 'returns average years exp' do 
      @mechanic1 = Mechanic.create!(name: 'John', years_experience: 2)
      @mechanic2 = Mechanic.create!(name: 'Jill', years_experience: 4)
      @mechanic3 = Mechanic.create!(name: 'Jack', years_experience: 6)
      @mechanic4 = Mechanic.create!(name: 'Julie', years_experience: 8)

      expect(Mechanic.average_years).to eq(5)
      end 
    end 
  end 

  describe 'Instance Methods' do 
    describe '#open_rides_by_thrill_rating' do 
      it 'only returns open rides ordered by thrill rating' do 
        @mechanic1 = Mechanic.create!(name: 'John', years_experience: 2)
        @ride1 = Ride.create!(name:'Squirrels Tails', open: true, thrill: 1)
        @ride2 = Ride.create!(name:'Broken Squirrels Tails', open: false, thrill: 2)
        @ride3 = Ride.create!(name:'Hippos Tails', open: true, thrill: 3)
        @ride4 = Ride.create!(name:'Tigers Tails', open: true, thrill: 4)
        @mechanic1.maintenences.create(ride: @ride1)
        @mechanic1.maintenences.create(ride: @ride2)
        @mechanic1.maintenences.create(ride: @ride3)

        expect(@mechanic1.open_rides_by_thrill_rating).to eq([@ride3, @ride1])
      end 
    end 
  end 
end 