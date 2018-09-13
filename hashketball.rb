require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        :alan_anderson => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        :reggie_evans => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        :brook_lopez => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        :mason_plumlee => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        :jason_terry => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        :jeff_adrien => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        :bismak_biyombo => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        :desagna_diop => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        :ben_gordon => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        :brendan_haywood => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  play = player.split(" ")
  play = play.join("_").downcase
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |name, stat_hash|
      if name.to_s == play
        return stat_hash[:points]
      end
    end
  end
end


def shoe_size(player)
  play = player.split(" ")
  play = play.join("_").downcase
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |name, stat|
      if play === name.to_s
        return stat[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |t, team_stat|
    return team_stat[:colors] if team_stat[:team_name].to_s == team
  end
end

def team_names
  arr = []
  game_hash.each do |team, team_stat|
    arr << team_stat[:team_name]
  end
  arr
end

def player_numbers(team)
  arr = []
  team_hash = game_hash.find do |t, team_stat|
    team == team_stat[:team_name]
  end  
  binding.pry
  stats = team_hash[1]
  stats[:players].each do |name, stat_hash|
    arr << stat_hash[:number]
  end
  #game_hash.each do |t, team_stat|
   # if team_stat[:team_name].to_s == team
    #  team_stat[:players].each do |name, stat_hash|
     #   arr << stat_hash[:number]
    #  end
  #  end
  #end
  arr
end

def player_stats(player)
  play = player.split(" ")
  play = play.join("_").downcase
  game_hash.each do |team, team_stat|
    team_stat[:players].each do |name, stat_hash|
      if play === name.to_s
        return stat_hash
      end
    end
  end
end




def big_shoe_rebounds
  max = 0
  mvp = nil
  game_hash.each do |team, team_stat|
    team_stat[:players].each do |name, stat_hash|
      if stat_hash[:shoe] > max
        max = stat_hash[:shoe]
        mvp = stat_hash[:rebounds]
      end
    end
  end
  mvp
end

def most_points_scored
  max = 0
  mvp = nil
  game_hash.each do |team, team_stat|
    team_stat[:players].each do |name, stat_hash|
      if stat_hash[:points] > max
        max = stat_hash[:points]
        mvp = name
      end
    end
  end
  return mvp
end

def winning_team
  max = 0
  mvt = nil
  game_hash.each do |team, team_stat|
    count = 0
    team_stat[:players].each do |name, stat_hash|
      count += stat_hash[:points]
    end
    if count > max
      max = count
      mvt = team_stat[:team_name]
    end
  end
  return mvt
end

def player_with_longest_name
  max = 0
  mvp = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |name, stat_hash|
      last_name = name.to_s.split("_")
      last_name = last_name[1]
      if last_name.length > max
        max = last_name.length
        mvp = name
      end
    end
  end
  mvp
end

def long_name_steals_a_ton?
  max = 0
  long_name = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |name, stat_hash|
      last_name = name.to_s.split("_")
      last_name = last_name[1]
      if last_name.length > max
        max = last_name.length
        long_name = name
      end
    end
  end
  max_steal = 0
  most_steals = nil
  game_hash.each do |team, team_stats|
    team_stats[:players].each do |name, stat_hash|
      if stat_hash[:steals] > max_steal
        max_steal = stat_hash[:steals]
        most_steals = name
      end
    end
  end
  return most_steals == long_name
end
