class Game
  def initialize
    @player_names = {
      1 => "Lionel Messi",
      2 => "Christiano Ronaldo",
      3 => "Pele",
      4 => "Marodona",
      5 => "Zinedine Zidan",
      6 => "Bobby Moore",
      7 => "Johan Cruyff",
      8 => "Franz Beckenbauer",
      9 => "Paolo Maldini",
      10 => "Titus Bramble"
    }

    @all_players = {}

    @team_names = {
      1 => "Clifton Posh",
      2 => "Knowle Knucklers"}

    @all_teams = {}


    @player_names.each do |number, name|
      @all_players[number] = Player.new(number, name)
    end

    @team_names.each do |number, team_name|
      @all_teams[number] = Team.new(number, team_name)
    end
  end

  def team_selection
    system("clear")
    puts "Welcome to Jumpers for Goalposts: The park football simulation game!"
    puts ""
    puts "Which team do want to be:"
    @all_teams.each {|number, team| puts "#{number}: #{team.name}"}

    print "Enter number: "
    @human_team_number = gets.chomp.to_i
    @team_names.each do |key, value|
      if key != @human_team_number then
        @computer_team_number = key
      end
    end
  end

  def show_all_players
    @all_players.each do |number, player|
      puts "#{number}:#{player.name} | Attack: #{player.attributes[:attack]} | Midfield: #{player.attributes[:midfield]} | Defence: #{player.attributes[:defence]}"
    end
    puts ""
  end

  def player_selection
    system("clear")
    puts "Your team is: #{@all_teams[@human_team_number].name}"
    puts ""

    while @all_players.empty? == false do
      puts "Choose player: "
      self.show_all_players

      print "Enter number: "
      player_number = gets.chomp.to_i

      @all_teams[@human_team_number].add_player(@all_players[player_number])
      @all_players.delete(player_number)

      computer_number = @all_players.keys.sample

      @all_teams[@computer_team_number].add_player(@all_players[computer_number])
      @all_players.delete(computer_number)
      system("clear")
    end
  end

  def show_teams
    system("clear")
    @all_teams.each do |number, team|
      puts team.name
      team.show_team_players
    end

  end


  def play()
    print "Play match? (y/n): "
    agree = gets.chomp

    if agree == "y" then
      system("clear")
      sleep(5)

      team1_score = (rand() * (@all_teams[1].attributes[:attack] + @all_teams[1].attributes[:midfield] + @all_teams[1].attributes[:defence]) / 10).to_i
      team2_score = (rand() * (@all_teams[2].attributes[:attack] + @all_teams[2].attributes[:midfield] + @all_teams[2].attributes[:defence]) / 10).to_i

      if team1_score > team2_score then
        puts "#{@all_teams[1].name} Win! #{team1_score} : #{team2_score}"
      elsif team1_score == team2_score then
        puts "It's a Draw! #{team1_score} : #{team2_score}"
      else
        puts "#{@all_teams[2].name} Win! #{team2_score} : #{ team1_score}"
      end
    else
      puts "No game"
      exit
    end
  end
end

class Player
  def initialize(number, name)
    @player_number = number
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

  def number
    return @player_number
  end

  def attributes
    return {name: @player_name, attack: @attack, midfield: @midfield, defence: @defence}
  end
end

class Team
  def initialize(number, name)
    @team_number = number
    @team_name = name
    @players = {}
  end

  def add_player(player)
    @players[player.number] = player.attributes
  end

  def show_team_players
    @players.each do |number, attributes|
      puts "#{attributes[:name]} | Attack: #{attributes[:attack]} | Midfield: #{attributes[:midfield]} | Defence: #{attributes[:defence]}"
    end
    puts ""
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
match.team_selection
match.player_selection
match.show_teams

match.play
