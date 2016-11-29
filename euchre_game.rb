Dir.glob(File.expand_path("../Euchre/*.rb")).each do |file|
    require file
end

class EuchreGame

    attr_accessor :deck, :players, :turn, :trump, :dealer_position

    ##
    # Initialization Block
    # Instantiates a Deck Object
    # Instantiates an array of 4 Player Objects
    # Assigns a random starting position
    # 11/29/2016 - Tested, Complete

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
        determine_trump
        trick_round
    end

    ##
    # Deal Round 
    # Tracks starting position
    # Assigns cards to players hands
    # 11/29/2016 - Tested, Complete

    def deal_round
        track_players
        assign_cards
    end

    def track_players
        @dealer_position = @dealer_position%4
        @dealer_position += 1
    end

    def dealer
        return @players[@dealer_position]
    end

    def assign_cards
        hands = @deck.deal
        @players.each_with_index do |player, index|
            player.hand = hands[index]
        end 
    end

    ##
    # Determining Trump 
    # 11/29/2016 - In Development

    def determine_trump
        order_round
        unless @trump
            call_round
        end
    end

    def order_round
        4.times do 
            if @players[track_players].order?
                order_up
                break
            end
        end
    end

    def order_up
        dealer.order_up
    end

    def call_round
        4.times do
            if @players[track_players].call?
                @players[track_players].call
                break
            end
        end
    end 

    ##
    # Trick Round

    def trick_round
        puts "implement trick round!"
    end
end 