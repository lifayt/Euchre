require 'minitest/autorun'
Dir.glob(File.expand_path("../*.rb")).each do |file|
    require file
end

@game = EuchreGame.new()
@game.play