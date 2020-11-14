require 'jumpers-for-goalposts'

describe 'play' do
  it 'outputs a random result of a game between two teams' do
    expect(play("Team 1", "Team 2")).to satisfy { |value| ["Team 1 Wins!","Team 2 Wins!"].include?(value)}
  end
end
