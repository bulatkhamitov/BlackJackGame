class Bank
  STARTING_BALANCE = 100
  BET = 10

  attr_accessor :balance

  class << self
    attr_accessor :bank
  end

  @bank = 0

  def initialize(player)
    @player = player
    @balance = STARTING_BALANCE
  end

  def refresh
    @balance = STARTING_BALANCE
  end

  def can_make_bet?
    @balance >= BET
  end

  def make_bet
    if can_make_bet?
      self.class.bank += BET
      @balance -= BET
    end
  end

  def deposit
    @balance += self.class.bank
    self.class.bank = 0
  end

  def return_bet
    @balance += BET
    self.class.bank = 0
  end
end
