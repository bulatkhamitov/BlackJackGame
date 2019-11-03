class Dealer < Player
  PASS_SCORE = 17

  def initialize
    super("Dealer")
  end

  def take_another?
    @hand.score < PASS_SCORE && @hand.cards.size == 2
  end

  def hidden_hand
    @hand.cards.map { '★' }.join(' ')
  end
end
