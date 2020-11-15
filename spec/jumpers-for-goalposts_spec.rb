require 'jumpers-for-goalposts'

describe 'Game' do
  describe 'play' do
    it 'outputs a random result of a game between two teams' do
      expect(play(clifton_posh, knowle_knucklers)).to satisfy { |value| ["Clifton Posh Wins!","Knowle Knucklers Wins!"].include?(value)}
    end
  end
end
