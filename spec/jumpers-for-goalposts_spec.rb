require 'jumpers-for-goalposts'

describe 'play' do
  it 'outputs a result of a game between two teams' do
    expect(Game.play).to eq "Team 1 Wins!"
  end
end
