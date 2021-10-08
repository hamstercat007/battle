feature 'Losing' do 
  scenario 'see a lose message if you reach 0HP first' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
  end
end 