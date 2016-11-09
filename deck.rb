
class Deck

    attr_accessor :deck, :id, :kitty

    def initialize 
        @deck = [] 
        @kitty = []
    end

    def generate_deck
        @deck = []
        @id = 1
        ['hearts', 'diamonds', 'spades', 'clubs'].each do |suit| 
            construct_suit(suit)
        end
        shuffle_deck
    end

    def construct_suit(type)
        (9..14).each do |number| 
            deck << [number, type]
            @id += 1
        end
    end

    def shuffle_deck
        5.times do 
            @deck = @deck.shuffle
        end
    end

    def deal
        generate_deck
        @kitty = @deck.slice!(0..3)
        hands = []
        4.times do 
            hands << @deck.slice!(0..3)
        end
        return hands
    end 

end