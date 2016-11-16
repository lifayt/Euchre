

class Player

    attr_accessor :hand

    def initialize 
        @hand = {}
    end

    def order?
        if match_strategy? 
            return true
        else 
            return false 
        end
    end 

    def match_strategy?

    end

    def order_up

    end

    def call?

    end 

    def call

    end

end 