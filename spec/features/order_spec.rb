require "rails_helper"

RSpec.feature "signing-in" do 

  describe "Posting order process", :type => :feature do
    before :each do
      Order.create(source: 'Ironhack Madrid', amount: '25')
    end

    it "posts my order" do
      visit '/users/:user_id/orders/'
      within(".amount-text") do
        fill_in 'Location', with: 'Ironhack Madrid'
        fill_in 'Amount', with: '25'
      end
      click_button 'Request Piggy'
      expect(page).to have_content 'Success'
    end
  end
end