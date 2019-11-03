class Deck
  attr_reader :ranks, :suits, :cards

  def initialize
    @ranks = [*(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['♣', '♥', '♠', '♦']
    @cards = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def show_deck
    @cards.each { |card| puts "#{card.rank} of #{card.suit}" }
  end

  def deal
    raise "No cards left" if @cards.empty?
    @cards.shift
  end
end
