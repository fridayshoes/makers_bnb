feature 'user signing up' do
  scenario 'signs up' do
    visit('/')
    fill_in :first_name, with: 'Rik'
    fill_in :last_name, with: 'Mayal'
    fill_in :email, with: 'rik@bottom.com'
    fill_in :username, with: 'Flash'
    fill_in :password, with: '1234567'
    click_button("Sign Up")
  end
end
  
