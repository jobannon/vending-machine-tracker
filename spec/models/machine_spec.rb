require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'relationships' do 
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  
  describe "instance methods " do 
    it ".average_snack_cost" do 
      owner_1 = Owner.create!(name: "super")
      vending_1 = owner_1.machines.create!(location: 'subway')
      snack_1 = vending_1.snacks.create!(name: "fritos", price: 100)
      snack_2 = vending_1.snacks.create!(name: "durritos", price: 50)
      expect(vending_1.average_snack_cost).to eq(75)
    end 

    it ".kind_of_snack_count" do 
      owner_1 = Owner.create!(name: "super")
      vending_1 = owner_1.machines.create!(location: 'subway')
      snack_1 = vending_1.snacks.create!(name: "fritos", price: 100, kind: "junk")
      snack_2 = vending_1.snacks.create!(name: "durritos", price: 50, kind: 'healthy')
      expect(vending_1.kind_of_snack_count).to eq(2)
    end
  end 
end
