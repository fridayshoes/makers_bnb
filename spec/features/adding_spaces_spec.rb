feature 'Adding a new space' do
  scenario 'A user can add a new space' do
    visit('/spaces/new')
    fill_in('space_name', with: 'fabulous seaviews')
    click_button('List my space')

    expect(page).to have_content 'fabulous seaviews'
  end
end