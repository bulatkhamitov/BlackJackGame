class Interface
  def get_player_name
    puts "=" * 40
    puts "BLACKJACK GAME on Ruby 2.2.10"
    puts "=" * 40
    print "Enter your name: "
    @name = gets.chomp
  end

  def introduction
    puts "Greetings, #{@name}!"
    puts "=" * 40
    puts "The game starts..."
    puts "Making bets..."
  end

  def balance_info(player_balance, dealer_balance)
    puts "=" * 40
    puts "Your balance: #{player_balance}"
    puts "Dealer's balance: #{dealer_balance}"
  end

  def player_turn_choice(player_hand, player_score, dealer_hidden_hand, add_card)
    puts "=" * 40
    puts "Your cards: #{player_hand}"
    puts "Your score: #{player_score}"
    puts "=" * 40
    puts "Dealer's cards: #{dealer_hidden_hand}"
    puts "=" * 40
    puts "What are your actions?"
    puts "[1] - open cards"
    puts "[2] - pass"
    puts "[3] - take 1 card" if add_card
    puts "=" * 40
    gets.chomp.to_i
  end

  def show_cards(player_hand, player_score, dealer_hidden_hand, dealer_score)
    puts "=" * 40
    puts "Your cards: #{player_hand}, score: #{player_score}"
    puts "=" * 40
    puts "Dealer's cards: #{dealer_hidden_hand}, score: #{dealer_score}"
    puts "=" * 40
  end

  def result_info(winner)
    case winner
    when "nobody"
      puts "Nobody"
    when "draw"
      puts "Draw"
    when "player"
      puts "You won"
    when "dealer"
      puts "Dealer won"
    end
  end

  def play_again_message
    puts "=" * 40
    puts "Play again?"
    puts "[1] - Yes"
    puts "[2] - No"
    puts "=" * 40
    gets.chomp.to_i
  end
end
