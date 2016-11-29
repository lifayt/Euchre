require 'minitest/autorun'
Dir.glob(File.expand_path("../*.rb")).each do |file|
    require file
end
class EuchreGameTest < Minitest::Test

    def setup
        @game = EuchreGame.new()
    end

    def test_init
        assert_equal @game.deck, !nil
        assert_equal @game.players.size, 4
        assert_equal @game.dealer_position.is_a? Integer, true 
    end

end