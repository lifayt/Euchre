require 'minitest/autorun'
Dir.glob(File.expand_path("../*.rb")).each do |file|
    require file
end

class EuchreGameTest < Minitest::Test

    def setup
        @game = EuchreGame.new()
    end

    def test_init
        assert_equal false, @game.deck.deck.nil? 
        assert_equal 4, @game.players.size
        assert_equal true, @game.dealer_position.is_a?(Integer)
    end

    def test_track_players
        assert_equal @game.dealer_position+1, @game.track_players
        10.times do 
            position = @game.track_players
            assert_equal true, ((position < 5) & (position > 0))
        end
    end

    def test_assign_cards
        @game.assign_cards
        @game.players.each do |player|
            assert_equal 5, player.hand.size
        end
    end

end