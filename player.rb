

class Player

    attr_accessor :hand, :preferred_trump

    def initialize 
        @hand = []
    end

    def order?
        match_strategy?
    end 

    def match_strategy?
        false
    end

    def order_up(card)
        @hand.pop()
        @hand.push(card)
    end

    def call?
        trump_confidence?
    end 

    def trump_confidence?
        false
    end

    def call
        @preferred_trump
    end

    def start_round
        
    end 

    def play_round

    end

end 