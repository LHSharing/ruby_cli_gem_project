
class RubyCliGemProject::Scraper
attr_accessor :knicks, :player_object, :page
@@all = []

def initialize
  @page = page
  @knicks = knicks
  #@player_object = player_object
  @@all << self
end

  def self.get_page
    page = Nokogiri::HTML(open("http://www.espn.com/nba/team/roster/_/name/ny"))
    @knicks = page.css(".Table2__tr")
    #@nyk_players = []
        #  players = page.css("td.Table2__td").text[0]
        #code below returns Name/pos/age etc as  - NamePOSAgeHTWTCollegeSalaryKadeem Allen0SG266' 3\"200 lbsArizona-Damyean Dotson21SG246' 6\"210 lbsHouston$1,378,242
        ###page.css(".Table2__table-scroller").text
        #knicks = all 17 rows in table two [0] = photo, not needed
        #####player_row.css(".Table2__td")[3]
  #end
  #def self.knicks_roster
        @knicks.shift
        @knicks.each do |player_row|
          @player_object = RubyCliGemProject::Player.new
          #binding.pry
          #good_times = player_row.css(."dib relative bg-clr-transparent")
                        #"https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3134880.png&w=80"

            @player_object.player_headshot_small = player_row.css(".aspect-ratio--object")[0].values[2]
                #=> "https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3134880.png&w=80" 
            @player_object.player_headshot_big = player_row.css(".aspect-ratio--object")[0].values[3]
                #=> "https://a.espncdn.com/i/headshots/nba/players/full/3134880.png"
            @player_object.name      = player_row.css("a").text
            @player_object.number    = player_row.css(".Table2__td")[1].css("span")[1].children.text
            @player_object.position  = player_row.css(".Table2__td")[2].text
            @player_object.player_height    = player_row.css(".Table2__td")[4].text
            @player_object.player_age       = player_row.css(".Table2__td")[3].text
            @player_object.player_weight    = player_row.css(".Table2__td")[5].text
            @player_object.player_college   = player_row.css(".Table2__td")[6].text
            @player_object.player_salary    = player_row.css(".Table2__td")[7].text
            @player_object.player_url       = player_row.css(".Table2__td")[1].css("a")[0].attr("href")
            # player_name      = player_row.css("a").text
            # player_number    = player_row.css(".Table2__td")[1].css("span")[1].children.text
            # player_position  = player_row.css(".Table2__td")[2].text
            # player_height    = player_row.css(".Table2__td")[4].text
           # @nyk_players << {name: player_name} #
            #, number: player_number, position: player_position, height: player_height}
              #, age: player_age, weight: player_weight, college: player_college, salary: player_salary, profile_url: player_url}
            #RubyCliGemProject::Player.all << player_object
            #RubyCliGemProject::Player.all << player_object
            end
            #binding.pry
            #@nyk_players.each_with_index do |player_stats, i|
            #   puts "#{i+1}: #{player_stats[:name]}"
               #{}Number: #{player_stats[:number]} Position: #{player_stats[:position]}, Height: #{player_stats[:height]}"
            #end
   #         Player.new(player_name)    
            #binding.pry
            #puts  @nyk_players[-1]
            #@@all << player_object
            RubyCliGemProject::Player.all
        end
        

#        def self.create_player #(nyk_players)
 #       @nyk_players.each do |nyk_each|
  #          binding.pry
        #end

        def self.today
        "Duh, eveybody knows that!"
        #kyle = Player.new
        end
   # end

def self.player_scrape
   @player_object = RubyCliGemProject::Player.new
    page = Nokogiri::HTML(open("http://www.espn.com/nba/player/_/id/3134880"))
    #player_object. = page.css(".header-stats").text # = "PPGAPGRPGPER10.14.52.917.26Career4.32.01.4"
    @player_object.tag_games_played = page.css(".colhead")[0].children[1].values[1] #"Games Played"
    @player_object.tag_minutes_per_game = page.css(".colhead")[0].children[2].values[1] #Minutes Per Game
    @player_object.tag_field_goals_made_attempted_per_game = page.css(".colhead")[1].children[3].values[1] #"Field Goals Made-Attempted Per Game"
    @player_object.tag_field_goal_percentage = page.css(".colhead")[1].children[4].values[1] #"Field Goal Percentage"
    @player_object.tag_three_point_field_goals_made_attempted_per_game = page.css(".colhead")[1].children[5].values[1] #"3-Point Field Goals Made-Attempted Per Game"
    @player_object.tag_three_point_field_goal_percentage = page.css(".colhead")[1].children[6].values[1] #"3-Point Field Goal Percentage"
    @player_object.tag_free_throws_made_attempted_per_game = page.css(".colhead")[1].children[7].values[1] #"Free Throws Made-Attempted Per Game
    @player_object.tag_free_throw_percentage = page.css(".colhead")[1].children[8].values[1] #""Free Throw Percentage"
    @player_object.tag_rebounds_per_game = page.css(".colhead")[1].children[9].values[1] #"Rebounds Per Game"
    @player_object.tag_assists_per_game = page.css(".colhead")[1].children[10].values[1] #"Assists Per Game"
    @player_object.tag_blocks_per_game = page.css(".colhead")[1].children[11].values[1] #=> "Blocks Per Game"
    @player_object.tag_Steals_per_game = page.css(".colhead")[1].children[12].values[1] #=> "Steals Per Game"
    @player_object.tag_personal_fouls_per_game = page.css(".colhead")[1].children[13].values[1] #=> "Personal Fouls Per Game"
    @player_object.tag_turn_overs_per_game = page.css(".colhead")[1].children[14].values[1] #=> "turn_overs_per_game"
    @player_object.tag_points_per_game = page.css(".colhead")[1].children[15].values[1] #=> "Points Per Game"
    # #player_object. = page.css(".colhead")[1].children[16].values[1] #

#binding.pry
    @player_object.games_played = page.css(".evenrow").children[11].children[0].text #=> "28"
    @player_object.minutes_per_game = page.css(".evenrow").children[12].children[0].text #=> "11.9"
    @player_object.field_goals_made_attempted_per_game = page.css(".evenrow").children[13].children[0].text #=> "1.5-3.5"
    @player_object.field_goal_percentage = page.css(".evenrow").children[14].children[0].text #=> ".439"
    @player_object.three_point_field_goals_made_attempted_per_game = page.css(".evenrow").children[15].children[0].text #=> "0.3-1.0"
    @player_object.three_point_field_goal_percentage  = page.css(".evenrow").children[16].children[0].text #=> ".296"
    @player_object.free_throws_made_attempted_per_game = page.css(".evenrow").children[17].children[0].text #=> "0.9-1.3"
    @player_object.free_throw_percentage = page.css(".evenrow").children[18].children[0].text #=> ".743"
    @player_object.rebounds_per_game = page.css(".evenrow").children[19].children[0].text #=> "1.4"
    @player_object.assists_per_game = page.css(".evenrow").children[20].children[0].text #=> "2.0"
    @player_object.blocks_per_game = page.css(".evenrow").children[21].children[0].text #=> "0.1"
    @player_object.steals_per_game = page.css(".evenrow").children[22].children[0].text #=> "0.4"
    @player_object.personal_fouls_per_game = page.css(".evenrow").children[23].children[0].text #=> "1.5"
    @player_object.turn_overs_per_game = page.css(".evenrow").children[24].children[0].text #=> "0.7"
    @player_object.points_per_game = page.css(".evenrow").children[25].children[0].text #=> "4.3"

    @player_object.player_headshot_from_player_page = page.css(".main-headshot").children[0].values[0] #=> "http://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3134880.png&w=350&h=254"
#<div class="main-headshot"><img src="http://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3134880.png&amp;w=350&amp;h=254" alt="Kadeem Allen"></div>
    #binding.pry
    #colhead

    #@nyk_players = []
        #  players = page.css("td.Table2__td").text[0]
        #code below returns Name/pos/age etc as  - NamePOSAgeHTWTCollegeSalaryKadeem Allen0SG266' 3\"200 lbsArizona-Damyean Dotson21SG246' 6\"210 lbsHouston$1,378,242
        ###page.css(".Table2__table-scroller").text
        #knicks = all 17 rows in table two [0] = photo, not needed
        #####player_row.css(".Table2__td")[3]
  #end
  #def self.knicks_roster
        #@knicks.shift
        #@knicks.each do |player_row|
         # player_object = RubyCliGemProject::Player.new

  #2nd scrape attributes
# Games Played
# Minutes Per Game
# Field Goals Made-Attempted Per Game
# Games Played
# Field Goal Percentage
# 3-Point Field Goals Made-Attempted Per Game
# 3-Point Field Goal Percentage
# Free Throws Made-Attempted Per Game
# Free Throw Percentage
# Rebounds Per Game
# Assists Per Game
# Blocks Per Game
# Steals Per Game
# Personal Fouls Per Game
# Turnovers Per Game
# Points Per Game
RubyCliGemProject::Player.all
        end

end

#hopefully changes are made
def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end


def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end

def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end


def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end

def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end


def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end

def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end


def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end

def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end


def big_ole_changes
  puts 'Hey Git, you can you here now, right?'
end




              









