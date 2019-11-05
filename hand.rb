class Hand
  ACE_LOW = 1
  ACE_HIGH = 11
  HIGH_RANK = 10

  attr_reader :cards, :score

  def initialize
    @cards = []
  end

  def reset
    @cards = []
  end

  def score
    sum = 0
    aces = 0
    @cards.each do |card|
      if card.face_card?
        sum += HIGH_RANK
      elsif card.ace_card?
        aces += 1
      else
        sum += card.rank.to_i
      end
    end

    if aces == 1
      if sum < 11
        sum += ACE_HIGH
      elsif sum >= 11
        sum += ACE_LOW
      end
    end

    if aces == 2
      if sum <= 9
        sum += (ACE_LOW + ACE_HIGH)
      elsif sum > 9
        sum += (ACE_LOW + ACE_LOW)
      end
    end

    if aces == 3
      sum += (ACE_HIGH + ACE_LOW + ACE_LOW)
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
