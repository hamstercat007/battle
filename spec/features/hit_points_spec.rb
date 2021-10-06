feature 'View hit points' do 
  scenario 'see Player 2 hit points' do 
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end
end 

feature 'Reduce hit points' do 
  scenario 'Attack to reduce Player 2\'s hit points by 10' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 50HP'
  end
end

    