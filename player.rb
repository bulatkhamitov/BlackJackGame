class Player
  attr_reader :name, :hand, :cards
  attr_accessor :bank

  def initialize(name)
    @name = name
    @hand = Hand.new
  end

  def take_card(cards)
    @hand.cards << cards.deal
  end
end
