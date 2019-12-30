require "rails_helper"

RSpec.describe Snack do 
  describe "Relationships" do 
    it {should have_many :machine_snacks }
    it {should have_many(:machines).through(:machine_snacks)}
  end
  describe "Validations" do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
  end 
end
