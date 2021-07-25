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
end 