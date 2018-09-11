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
  game_hash.each do |x, i|
    i[:players].each do |y, e|
      if play === y.to_s
        return e[:points]
      end
    end
  end
end

def shoe_size(player)
  play = player.split(" ")
  play = play.join("_").downcase
  game_hash.each do |x, i|
    i[:players].each do |y, e|
      if play === y.to_s
        return e[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |x, i|
    return i[:colors] if i[:team_name].to_s == team
  end
end

def team_names
  arr = []
  game_hash.each do |x, i|
    arr << i[:team_name]
  end
  arr
end

def player_numbers(team)
  arr = []
  game_hash.each do |x, i|
    if i[:team_name].to_s == team
      i[:players].each do |y, e|
        arr << e[:number]
      end
    end
  end
  arr
end

def player_stats(player)
  play = player.split(" ")
  play = play.join("_").downcase
  game_hash.each do |x, i|
    i[:players].each do |y, e|
      if play === y.to_s
        return e
      end
    end
  end
end

def big_shoe_rebounds
  max = 0
  mvp = nil
  game_hash.each do |i, j|
    j[:players].each do |k, l|
      if l[:shoe] > max
        max = l[:shoe]
        mvp = l[:rebounds]
      end
    end
  end
  mvp
end
