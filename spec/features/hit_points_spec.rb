feature 'View hit points' do 
  # scenario 'see Player 2 hit points' do 
  #   sign_in_and_play
  #   expect(page).to have_content 'Mittens: 60HP'
  # end

  scenario 'each player can see their hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Charlotte: 60HP'
  end
end 


    