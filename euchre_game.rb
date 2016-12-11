Dir.glob(File.expand_path("../Euchre/*.rb")).each do |file|
    require file
end

class EuchreGame

    attr_accessor :deck, :turn, :trump, :dealer_position
    attr_accessor :players, :team_1, :team_2
    ##
    # Initialization Block
    # Instantiates a Deck Object
    # Instantiates an array of 4 Player Objects
    # Assigns a random starting position
    # 11/29/2016 - Tested, Complete

    def initialize
        @deck = Deck.new()
        @players = []
        create_players
        @dealer_position = rand(4)
    end 

    def create_players
        4.times do 
            @players << Player.new()
        end
        @team_1 = {:players => [@players[0], @players[2]], :attacking => false, :defending => false}
        @team_2 = {:players => [@players[1], @players[3]], :attacking => false, :defending => false}
    end 

    def play
        deal_round
        determine_trump
        trick_rounds
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
        @dealer_position += 1
        @dealer_position = @dealer_position%4
        return @dealer_position
    end

    def dealer
        @players[@dealer_position]
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
    # 12/6/2016 - Tested, no bugs, functionality missing

    def determine_trump
        order_round
        unless @trump
            call_round
        end
    end

    def order_round
        4.times do 
            player = @players[track_players]
            if player.order?
                set_teams(player)
                order_up
                break
            end
        end
    end

    def order_up
        dealer.order_up
    end

    def set_teams(player)
        [@team_1, @team_2].each do |team|
            if team.players.contains? (player)
                team.attacking = true
                team.defending = false
            else 
                team.defending = true
                team.attacking = false
            end
        end
    end

    def call_round
        @trump = nil
        3.times do
            player = @players[track_players]
            if player.call?
                player.call
                set_teams(player)
                break
            end
        end
        if @trump.nil?
            screw_the_dealer
        end
    end 

    def screw_the_dealer
        @players[@dealer_position].call
    end

    ##
    # Trick Round
    # 12/6/2016 In Development

    def trick_rounds
        trick = Trick.new(@players)
        trick.play
    end

end 