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
end 
