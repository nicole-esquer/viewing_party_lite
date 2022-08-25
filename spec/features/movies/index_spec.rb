require 'rails_helper'

RSpec.describe 'Movies Results Page', type: :feature do
   it 'shows top rated movies button' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit user_discover_index_path(user.id)

      click_button('Discover Top Rated Movies')

      expect(current_path).to eq(user_movies_path(user.id))
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Average Review Score: 8.7")
   end

   xit 'keyword results' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")
      
      visit "/users/#{user.id}/discover"

      fill_in :query, with: 'Fight Club'
      click_button 'Search'

      expect(current_path).to eq(user_movies_path(user.id))
      expect(page).to have_content("Fight Club")

      click_button 'Discover Movies'
      expect(current_path).to eq(user_discover_index_path(user.id))

      visit "/users/#{user.id}/discover"

      click_button('Discover Top Rated Movies')

      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Average Review Score: 8.7")
   end
end