class Card
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank  = rank
    @suit  = suit
    @value = value
  end

  def value
    if @rank.class == Fixnum
      @value = @rank
    elsif @rank == 'A'
      @value = 1
    else
      @value = 10
    end
  end
end
