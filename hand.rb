class Hand
  attr_reader :cards, :score

  def initialize
    @cards = []
  end

  def reset
    @cards = []
  end

  def score
    @score = 0
    aces   = 0
    @cards.each do |card|
      aces += 1 if card.rank == 'A'
      @score += card.value
    end
    aces.times { @score += 10 if @score < 21 }
    @score
  end

  def two_cards?
    @cards.size == 2
  end

  def show
    (@cards.map { |card| "#{card.rank}#{card.suit}" }).join(' ')
  end
end
