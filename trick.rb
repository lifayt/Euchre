

class Trick 

    attr_accessor :players, :card_pot, :winner

    def initialize(players)
        @players = players
    end

    def play
        determine_starting_player
        five_tricks
        score
    end

end