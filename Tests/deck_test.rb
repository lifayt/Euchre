require 'minitest/autorun'
require '../deck.rb'

class DeckTest < Minitest::Test

    def setup
        @deck = Deck.new
    end

    def test_deck_generation
        assert_equal 0, @deck.deck.size 
        @deck.generate_deck
        assert_equal 24, @deck.deck.size
    end

    def test_suits
        @deck.generate_deck
        counts = 0
        uniqArr = @deck.deck.uniq { |card| card[1] }
        uniqArr.each { |card| counts+=1 }
        assert_equal 4, counts
    end

    def test_numbers
        @deck.generate_deck
        assert_equal false, @deck.deck.any? { |card| card[0] < 8 || card[0] > 14}
    end

    def test_deal
        @deck.generate_deck
        assert_equal 4, @deck.deal.size
    end

    def test_kitty 
        @deck.generate_deck
        @deck.deal
        assert_equal 4, @deck.kitty.size
    end
end