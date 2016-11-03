

class EuchreGame 

    attr_accessor :deck, :dealer, :players, :turn

    def initialize
        @deck = Deck.new()
        @dealer = Dealer.new()
        @players = []
        @turn = 0
        4.times do 
            @players << Player.new()
        end
    end 

    def play
        dealing_round
        trick_round
    end

    def dealing_round
        update_turns
        Dealer.deal
    end

    def update_turns
        @turn = @turn%4
        @turn += 1
    end
end 