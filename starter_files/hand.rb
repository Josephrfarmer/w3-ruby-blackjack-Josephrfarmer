class Hand 
  attr_accessor :player_hand

  def initialize 
    @player_hand = []
  end

  def cards
    cards = @player_hand.map do |card|
      card.to_s
    end
    cards.join(', ')
  end


  def total
    @player_hand.map do |hand|
      hand.value
    end.sum
  end

  def busted?
    if hand.total > 21
      puts "Sorry you busted"
      @wallet = @wallet - 10 

    elsif @hand.total > 21 && @hand.includes?(:A)
      @hand.total = @hand.total - 10 

    elsif @hand.total < 21
      puts "Would you like to (h)it or (s)tay?"

    end
  end

end 
