
class Dealer

    attr_accessor :players, :deck

    def initialize(players, deck)
        @players = players
        @deck = deck
    end

    def deal
        deck.generate_deck
        players.each do |player|
            player.hand = @deck.deck.slice!(0..3)
        end
        @kitty = @deck.deck.slice!(0..3)
    end 

end
