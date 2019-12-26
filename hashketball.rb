def game_hash
  {:home => 
  {:team_name => "Brooklyn Nets", :colors => ["Black", "White"],
  :players => [
    
    {:player_name => "Alan Anderson",
    :number => 0,
    :shoe => 16,
    :points => 22,
    :rebounds => 12,
    :assists => 12,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 1},
    
    {:player_name => "Reggie Evans",
    :number => 30,
    :shoe => 14,
    :points => 12,
    :rebounds => 12,
    :assists => 12,
    :steals => 12,
    :blocks => 12,
    :slam_dunks => 7},
    
    {:player_name => "Brook Lopez",
    :number => 11,
    :shoe => 17,
    :points => 17,
    :rebounds => 19,
    :assists => 10,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 15},
    
    {:player_name => "Mason Plumlee",
    :number => 1,
    :shoe => 19,
    :points => 26,
    :rebounds => 11,
    :assists => 6,
    :steals => 3,
    :blocks => 8,
    :slam_dunks => 5},
    
    {:player_name => "Jason Terry",
    :number => 31,
    :shoe => 15,
    :points => 19,
    :rebounds => 2,
    :assists => 2,
    :steals => 4,
    :blocks => 11,
    :slam_dunks => 1}]},
    
  :away => 
  {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"],
  :players => [
    
    {:player_name => "Jeff Adrien",
    :number => 4,
    :shoe => 18,
    :points => 10,
    :rebounds => 1,
    :assists => 1,
    :steals => 2,
    :blocks => 7,
    :slam_dunks => 2},
    
    {:player_name => "Bismack Biyombo",
    :number => 0,
    :shoe => 16,
    :points => 12,
    :rebounds => 4,
    :assists => 7,
    :steals => 22,
    :blocks => 15,
    :slam_dunks => 10},
    
    {:player_name => "DeSagna Diop",
    :number => 2,
    :shoe => 14,
    :points => 24,
    :rebounds => 12,
    :assists => 12,
    :steals => 4,
    :blocks => 5,
    :slam_dunks => 5},
    
    {:player_name => "Ben Gordon",
    :number => 8,
    :shoe => 15,
    :points => 33,
    :rebounds => 3,
    :assists => 2,
    :steals => 1,
    :blocks => 1,
    :slam_dunks => 0},
    
    {:player_name => "Kemba Walker",
    :number => 33,
    :shoe => 15,
    :points => 6,
    :rebounds => 12,
    :assists => 12,
    :steals => 7,
    :blocks => 5,
    :slam_dunks => 12}]}}
end

def num_points_scored(player_name)
  data = game_hash
  side_array = data.keys
  side_array.each do | side |
    roster = data[side][:players]
    roster.each do | player_hash |
      if player_hash[:player_name] == player_name
        return player_hash[:points]
      end
    end
  end
end

def shoe_size(player_name)
  data = game_hash
  side_array = data.keys
  side_array.each do | side |
    roster = data[side][:players]
    roster.each do | player_hash |
      if player_hash[:player_name] == player_name
        return player_hash[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  data = game_hash
  side_array = data.keys
  side_array.each do | side |
    team_hash = data[side]
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  end
end

def team_names
  data = game_hash
  sides = data.keys
  result = []
  sides.each do | side |
    result.push data[side][:team_name]
  end
  result
end

def player_numbers(team_name)
  data = game_hash
  sides = data.keys
  number_array = []
  sides.each do | side |
    if data[side][:team_name] == team_name
      data[side][:players].each do | player_hash |
        number_array.push player_hash[:number]
      end
    end
  end
  number_array
end

def player_stats(player_name)
  data = game_hash
  side_array = data.keys
  player_stats = {}
  side_array.each do | side |
    roster = data[side][:players]
    roster.each do | player_hash |
      if player_hash[:player_name] == player_name
        player_stats = player_hash
      end
    end
  end
  player_stats.reject! { |k| k == :player_name }
end

def big_shoe_rebounds
  data = game_hash
  side_array = data.keys
  shoe_sizes = []
  player_list = []
  side_array.each do | side |
    roster = data[side][:players]
    roster.each do | player_hash |
      shoe_sizes.push player_hash[:shoe]
      player_list.push player_hash
    end
  end
  shoe_sizes.sort!
  player_list.each do | player_hash |
    if player_hash[:shoe] == shoe_sizes[9]
      return player_hash[:rebounds]
    end
  end
end

def most_points_scored
  data = game_hash
  side_array = data.keys
  points_scored = []
  player_list = []
  side_array.each do | side |
    roster = data[side][:players]
    roster.each do | player_hash |
      points_scored.push player_hash[:points]
      player_list.push player_hash
    end
  end
  points_scored.sort!
  player_list.each do | player_hash |
    if player_hash[:points] == points_scored[9]
      return player_hash[:player_name]
    end
  end
end

def winning_team
  data = game_hash
  side_array = data.keys
  scores = []
  teams_list = {}
  side_array.each do | side |
    roster = data[side][:players]
    team_name = data[side][:team_name]
    points_scored = 0
    roster.each do | player_hash |
      points_scored += player_hash[:points]
    end
    scores.push points_scored
    teams_list[team_name] = points_scored
  end
  scores.sort!
  p teams_list
end