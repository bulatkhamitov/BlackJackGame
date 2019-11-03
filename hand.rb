class Hand
  attr_reader :cards, :score

  def initialize
    @cards = []
  end

  def reset
    @cards = []
  end

  def score
    sum = 0
    @cards.each do |card|
      if card.face_card?
        sum += 10
      elsif card.ace_card?
        if sum <= 10
          sum += 11
        else
          sum += 1
        end
      else
        sum += card.rank.to_i
      end
    end
    sum
  end

  def two_cards?
    @cards.size == 2
  end

  def show
    (@cards.map { |card| "#{card.rank}#{card.suit}" }).join(' ')
  end
end
