# require "rails_helper"

# RSpec.feature "signing-in" do 

#   describe "the signin process", :type => :feature do
#     before :each do
#       User.create(email: 'user@example.com', password: 'password')
#     end

#     it "signs me in" do
#       visit 'users/sign_in'
#       within("users/sign_in") do
#         fill_in 'Email', with: 'user@example.com'
#         fill_in 'Password', with: 'password'
#       end
#       click_button 'Sign in'
#       expect(page).to have_content 'Success'
#     end
#   end
# end