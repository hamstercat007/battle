feature 'Attack Player 2' do
  scenario 'Attack and receive confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Charlotte attacked Mittens'

    save_and_open_page 
  end
end

feature 'Attacking' do 
  scenario 'reduce Player 2\'s hit points by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_link 'OK'
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end
end
