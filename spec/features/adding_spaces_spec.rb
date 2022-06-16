feature 'Adding a new space' do
  scenario 'A user can add a new space' do
    visit('/spaces/new')
    fill_in('space_name', with: 'The Barn')
    fill_in('description', with: 'fabulous seaviews')
    fill_in('price_per_night', with: 70.00)
    click_button('List my space')

    expect(page).to have_content 'fabulous seaviews'
  end
end