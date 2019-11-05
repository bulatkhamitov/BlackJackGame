class Deck
  attr_reader :ranks, :suits, :cards

  def initialize
    @cards = []
  end

  def build_deck
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def show_deck
    @cards.each { |card| puts "#{card.rank} of #{card.suit}" }
  end

  def deal
    @cards.shift
  end
end
