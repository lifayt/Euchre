require 'minitest/autorun'
Dir.glob(File.expand_path("../*.rb")).each do |file|
    require file
end

class PlayerTest < MiniTest::Test

    def setup
        @player = Player.new()
    end

    def init_test
        assert_equal x = [], @player.hand
    end


end