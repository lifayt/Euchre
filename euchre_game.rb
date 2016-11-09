Dir.glob(File.expand_path("../Euchre/*.rb")).each do |file|
    require file
end

class EuchreGame 

    attr_accessor :deck, :players, :turn

    def initialize
        @deck = Deck.new()
        @players = []
        4.times do 
            @players << Player.new()
        end
        @turn = 0
    end 

    def play
        dealing_round
        trick_round
    end

    def dealing_round
        update_turns
        assign_cards(@deck.deal)
    end

    def update_turns
        @turn = @turn%4
        @turn += 1
    end

    def assign_cards(hands)
        @players.each_with_index do |player, index|
            player.hand = hands[index]
            puts player.hand
        end 
    end

    def trick_round
        puts "implement trick round!"
    end
end 

game = EuchreGame.new
game.play