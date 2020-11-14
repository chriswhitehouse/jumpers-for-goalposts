class Game
  def initialize
    count = 1
    @game_players = []
    while count < 20 do
      player_name = "Player " + count.to_s
      player_name = player_name.to_sym
      player_name = Player.new(player_name)
      @game_players.push(player_name)
      count += 1
    end
  end

  def show_game_players
    @game_players.each do |player|
      puts player
    end
end



  def play(team1,team2)
    team1_attack_score = team1.attributes[:attack] + 0.5 * team1.attributes[:midfield]
    team2_attack_score = team2.attributes[:attack] + 0.5 * team2.attributes[:midfield]

    team1_defence_score = team1.attributes[:defence] + 0.5 * team1.attributes[:midfield]
    team2_defence_score = team2.attributes[:defence] + 0.5 * team2.attributes[:midfield]

    team1_score = [team1_attack_score - team2_defence_score, 0].max.to_i
    team2_score = [team2_attack_score - team1_defence_score,0 ].max.to_i

    puts "#{team1.name}: #{team1_score}"
    puts "#{team2.name}: #{team2_score}"
  end
end

class Player
  def initialize(name)
    @player_name = name
    @attack = rand(11)
    @midfield = rand(11)
    @defence = rand(11)
  end

  def show_attributes
    puts "Attack: #{@attack}, Midfield: #{@midfield}, Defence: #{@defence}"
  end

  def name
    return @player_name
  end

  def attributes
    return {attack: @attack, midfield: @midfield, defence: @defence}
  end
end

class Team
  def initialize(name)
    @team_name = name
    @players = {}
  end

  def add_player(player)
    @players[player.name] = player.attributes
  end

  def show_players
    puts @players
  end

  def attributes
    attack = 0
    midfield = 0
    defence = 0

    @players.each do |key, value|
      attack += value[:attack]
      midfield += value[:midfield]
      defence += value[:defence]
    end

    @team_attributes = {attack: attack, midfield: midfield, defence: defence}

    return @team_attributes
  end

  def name
    return @team_name
  end
end

match = Game.new
match.show_game_players

#match.play(team1,team2)
