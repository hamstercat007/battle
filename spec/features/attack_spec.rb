feature 'Attacking' do 
  scenario 'reduce Player 2\'s hit points by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end

  scenario 'Player 2 attacks Player 1, and Player 1 receives confirmation' do 
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    expect(page).to have_content 'Mittens attacked Charlotte'
  end 

  scenario 'Player 2 attack on Player 1 will reduce Player 1\'s hit points' do 
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Charlotte: 60HP'
    expect(page).to have_content 'Charlotte: 50HP'
  end 
end
