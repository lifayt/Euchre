

class Trick 

    attr_accessor :players, :card_pot, :winner

    def initialize(players, trump, team_1, team_2, starting_player)
        @players = players
    end

    def play
        five_tricks
        score
    end

    def five_tricks
        five.times do 
            play_trick
        end
    end

    def play_trick
        @players[starting_player].start_round
        3.times do |index| 
            @players[(starting_player + index)%4].play_round
        end
    end 
end