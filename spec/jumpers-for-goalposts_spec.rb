require './jumpers-for-goalposts'

describe 'game' do
  it 'outputs a result of a game between two teams' do
    expect(game("team1","team2")).to eq "Team 1 Wins!"
  end
end
