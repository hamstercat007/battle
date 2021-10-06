feature 'Attack Player 2' do
  scenario 'Attack and receive confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Charlotte attacked Mittens'

    save_and_open_page #this doesn't work anymore 
  end
end