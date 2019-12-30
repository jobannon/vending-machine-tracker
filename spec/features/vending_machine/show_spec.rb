require 'rails_helper'

RSpec.describe "as a visitor" do 
  describe "when I visit a vending machine show page " do 
    before(:each) do 
      @owner_1 = Owner.create!(name: "super")
      @vending_1 = @owner_1.machines.create!(location: 'subway')
      @snack_1 = @vending_1.snacks.create!(name: "fritos", price: 100)
      @snack_2 = @vending_1.snacks.create!(name: "durritos", price: 50)
    end
    it "shows me 
    -a list of the all the snacks associated 
    -and price " do 

      visit machine_path(@vending_1)

      within "#snacks-#{ @snack_1.id }" do 
        expect(page).to have_content(@snack_1.name )
        expect(page).to have_content(@snack_1.price)
      end 
      within "#snacks-#{ @snack_2.id }" do 
        expect(page).to have_content(@snack_2.name )
        expect(page).to have_content(@snack_2.price)
      end 
    end
    it "shows me an average price for all of the snacks in that machine" do 
      visit machine_path(@vending_1)

       within "#machine_stats" do 
         save_and_open_page 
         expect(page).to have_content("$75") 
       end 
    end 
  end 
end 
