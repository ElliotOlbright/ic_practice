require 'rails_helper' 

RSpec.describe 'The Mechanic Index Page' do 
  before :each do 
    @mechanic1 = Mechanic.create!(name: 'John', years_experience: 2)
    @mechanic2 = Mechanic.create!(name: 'Jill', years_experience: 4)
    @mechanic3 = Mechanic.create!(name: 'Jack', years_experience: 6)
    @mechanic4 = Mechanic.create!(name: 'Julie', years_experience: 8)

    visit '/mechanics' 
  end 

  it 'has a head for all mechanics' do 
    expect(page).to have_content('All Mechanics')
  end 

  it 'can display all mechanics' do 
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic2.name)
    expect(page).to have_content(@mechanic3.name)
    expect(page).to have_content(@mechanic4.name)
    expect(page).to have_content(@mechanic1.years_experience)
    expect(page).to have_content(@mechanic2.years_experience)
    expect(page).to have_content(@mechanic3.years_experience)
    expect(page).to have_content(@mechanic4.years_experience)
  end 

  it 'can display average years of experience for all mechanics' do 
    expect(page).to have_content('Average Years Of Experience: 5')
  end 

end 