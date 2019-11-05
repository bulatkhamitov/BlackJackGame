class Card
  attr_reader :rank, :suit

  RANKS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['♣', '♥', '♠', '♦'].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    validate!
  end

  def face_card?
  	['J', 'Q', 'K'].include?(@rank)
  end

  def ace_card?
  	['A'].include?(@rank)
  end

  private

  def validate!
  	raise ArguementError, "#{@suit} is not permitted" unless SUITS.include?(@suit)
  	raise ArguementError, "#{@rank} is not permitted" unless RANKS.include?(@rank)
  end

  def valid?
  	validate!
  	true
  rescue ArguementError
  	false
  end
end
