feature 'Switch turns' do
  before do 
    sign_in_and_play
  end 

  scenario 'see current turn' do
    expect(page).to have_content('Charlotte\'s turn')
  end

  scenario 'after Player 1 attacks' do 
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content ("Charlotte's turn")
    expect(page).to have_content ('Mittens\'s turn')
  end 
end