Dir.glob(File.expand_path("../Euchre/*.rb")).each do |file|
    require file
end

class EuchreGame 

    attr_accessor :deck, :dealer, :players, :turn

    def initialize
        @deck = Deck.new()
        @players = []
        4.times do 
            @players << Player.new()
        end
        @dealer = Dealer.new(@players, @deck)
        @turn = 0
    end 

    def play
        dealing_round
        trick_round
    end

    def dealing_round
        update_turns
        @dealer.deal
    end

    def update_turns
        @turn = @turn%4
        @turn += 1
    end
end 

game = EuchreGame.new
game.play