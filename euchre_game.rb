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
        @dealer_position = rand(4)
    end 

    def play
        deal_round
        order_round 
        call_round
        trick_round
    end

    def deal_round
        track_players
        assign_cards(@deck.deal)
    end

    def track_players
        @dealer_position = @dealer_position%4
        @dealer_position += 1
    end

    def dealer
        return @players[@dealer_position]
    end

    def assign_cards(hands)
        @players.each_with_index do |player, index|
            player.hand = hands[index]
        end 
    end

    def order_round
        4.times do 
            if @players[track_players].order?
                order_up
            end
        end
    end

    def order_up

    end

    def call_round
    
    end 

    def trick_round
        puts "implement trick round!"
    end
end 

game = EuchreGame.new
game.play