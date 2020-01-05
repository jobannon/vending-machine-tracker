require "rails_helper"

RSpec.describe "as a visitor" do 
  describe "when i visit a snack show page" do 
    before(:each) do 
      @owner_1 = Owner.create!(name: "super")
      @vending_1 = @owner_1.machines.create!(location: 'subway')
      @snack_1 = Snack.create!(name: "fritos", price: 100, kind: "junk")
      @snack_2 = Snack.create!(name: "durritos", price: 50, kind: "junk")

      @vending_1.snacks << @snack_1 << @snack_2
      
      @vending_2 = @owner_1.machines.create!(location: 'basement')
      @snack_3 = Snack.create!(name: "churros", price: 80, kind: "heavenly")

      @vending_2.snacks << @snack_1 << @snack_2 << @snack_3

    end 

    it "- I see the name of that snack
        - I see the price for that snack
        - I see a list of locations with vending machines that carry that snack
        - I see the average price for snacks in those vending machines
        - I see a count of the different kinds of items in that vending machine." do 
      visit snack_path(@snack_1)   

      within "#show_that_snack-#{ @snack_1.id }" do 
        expect(page).to have_content(@snack_1.name)
        expect(page).to have_content(@snack_1.price)

        within "#snack-per-machine-#{ @vending_1.id }" do 
          expect(page).to have_content("subway")
          expect(page).to have_content("2 kinds")
        end

        within "#snack-per-machine-#{ @vending_2.id }" do 
          expect(page).to have_content("basement")
          expect(page).to have_content("3 kinds")
        end
      end

    end
  end 
end
