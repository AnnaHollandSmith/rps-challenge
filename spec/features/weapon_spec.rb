require_relative '../spec_helper'


feature 'confirming weapons' do
  before do
    sign_in_and_play
  end

  scenario 'player chooses rock' do
    click_button 'rock'
    expect(page).to have_content 'Anna, your chosen weapon is: rock'
  end

  scenario 'player chooses paper' do
    click_button 'paper'
    expect(page).to have_content 'Anna, your chosen weapon is: paper'
  end

  scenario 'player chooses scissors' do
    click_button 'scissors'
    expect(page).to have_content 'Anna, your chosen weapon is: scissors'
  end
end
