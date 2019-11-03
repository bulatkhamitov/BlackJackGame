class Game
  BET = 10
  MAX_CARDS = 3
  BLACKJACK = 21

  attr_reader :deck

  def initialize
    @interface = Interface.new
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @player.bank = Bank.new(@player)
    @dealer.bank = Bank.new(@dealer)
    @deck = Deck.new
  end

  def player_name
    @interface.get_player_name
  end

  def introduction
    @interface.introduction
  end

  def processing
    @interface.processing
  end

  def start
    system('clear')
    introduction
    loop do
      if @player.hand.cards 
        @player.hand.reset
        @dealer.hand.reset
        @player.bank.refresh
        @dealer.bank.refresh
      end
      2.times {@player.take_card(@deck)}
      2.times {@dealer.take_card(@deck)}
      return unless start_game
    end
  end

  def start_game
    start_bet
    player_turn
    again?
  end

  def balance_info
    @interface.balance_info(@player.bank.balance, @dealer.bank.balance)
  end

  def start_bet
    processing
    @player.bank.make_bet
    @dealer.bank.make_bet
    balance_info
  end

  def player_choice
    @interface.player_turn_choice(@player.hand.show, 
      @player.hand.score, @dealer.hidden_hand, @player.hand.two_cards?)
  end

  def player_turn
    choice = player_choice
    case choice
    when 1
      open_cards
    when 2
      dealer_turn
    when 3
      if @player.hand.two_cards?
        @player.take_card(@deck)
        dealer_turn
      end
    end
  end

  def dealer_turn
    @dealer.take_card(@deck) if @dealer.take_another?
    next_turn?
  end

  def next_turn?
    if deck_check
      open_cards
    else
      player_turn
    end
  end

  def deck_check
    @dealer.hand.cards.size == MAX_CARDS && @player.hand.cards.size == MAX_CARDS
  end

  def show_cards
    @interface.show_cards(@player.hand.show, 
      @player.hand.score, @dealer.hand.show, @dealer.hand.score)
  end

  def open_cards
    show_cards
    @interface.result_info(winner)
    case winner
    when 'draw'
      return_bet(@player, @dealer)
    when 'player'
      @player.bank.deposit
    when 'dealer'
      @dealer.bank.deposit
    end
    balance_info
  end

  def player_blackjack?
    @player.hand.score == BLACKJACK
  end

  def dealer_blackjack?
    @dealer.hand.score == BLACKJACK
  end

  def player_no_blackjack?
    @player.hand.score != BLACKJACK
  end

  def dealer_no_blackjack?
    @dealer.hand.score != BLACKJACK
  end

  def player_overflowed?
    @player.hand.score > BLACKJACK
  end

  def dealer_overflowed?
    @dealer.hand.score > BLACKJACK
  end 

  def player_superior?
    @player.hand.score > @dealer.hand.score
  end

  def dealer_superior?
    @dealer.hand.score > @player.hand.score
  end

  def winner
    player_score = @player.hand.score
    dealer_score = @dealer.hand.score

    return "draw"   if player_score == dealer_score
    return "nobody" if player_overflowed? && dealer_overflowed?
    return "player" if (player_superior? && player_score <= BLACKJACK) || dealer_overflowed? || (player_blackjack? && dealer_no_blackjack?)
    return "dealer" if (dealer_superior? && dealer_score <= BLACKJACK) || player_overflowed? || (dealer_blackjack? && player_no_blackjack?)
  end

  def return_bet(*participants)
    participants.each { |participant| participant.bank.return_bet }
  end
  
  def again?
    @interface.play_again_message == 1
  end
end
