# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def player_stats(query_player)
  for i in 0..(all_players.length - 1)
    if all_players[i][:player_name] == query_player
      return all_players[i]
    end
  end
end

def player_numbers(team)
  player_number_array = []
  game_hash.each do |side, attributes|
    if attributes[:team_name] == team
      attributes[:players].each do |player|
        player_number_array << player[:number]
        
      end
    end
  end
  return player_number_array
end

def num_points_scored(query_player)
  player_stats(query_player)[:points]
end

def shoe_size(query_player)
  player_stats(query_player)[:shoe]
end

def team_colors(team_name)
  game_hash.each do |side, attributes|
    # binding.pry
    if attributes[:team_name] == team_name
      return attributes[:colors]
    end
  end
end

def team_names
  team_name_array = []
  game_hash.each do |side, attributes|
    team_name_array << attributes[:team_name]
    # puts team_name_array
  end
  return team_name_array
end

def big_shoe_rebounds
  shoe_size_max = 0
  player_max_size = ""
  for i in 0..(all_players.length - 1)
    if all_players[i][:shoe] > shoe_size_max
      shoe_size_max = all_players[i][:shoe]
      player_max_size = all_players[i][:rebounds]
    end
  end
  return player_max_size
end

num_points_scored("Kemba Walker")
team_names