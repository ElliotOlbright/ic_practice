require 'rails_helper'

RSpec.describe 'Mechanics Show Page' do 
  it 'can display the name and years experience of mechanic' do 
    @mechanic1 = Mechanic.create!(name: 'John', years_experience: 2)

    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_experience)
  end 

  it 'displays the names of all of the OPEN rides this mechanics is working on' do 
    @mechanic1 = Mechanic.create!(name: 'John', years_experience: 2)
    @ride1 = Ride.create!(name:'Squirrels Tails', open: true, thrill: 4)
    @ride2 = Ride.create!(name:'Broken Squirrels Tails', open: false, thrill: 4)
    @ride3 = Ride.create!(name:'Hippos Tails', open: true, thrill: 4)
    @ride4 = Ride.create!(name:'Tigers Tails', open: true, thrill: 10)
    @mechanic1.maintenences.create(ride: @ride1)
    @mechanic1.maintenences.create(ride: @ride2)
    @mechanic1.maintenences.create(ride: @ride3)

    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride3.name)
    expect(page).to have_no_content(@ride4.name)
    expect(page).to have_no_content(@ride2.name)
  end 
end 
