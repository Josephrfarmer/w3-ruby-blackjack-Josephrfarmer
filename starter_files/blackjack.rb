require_relative "card"
require_relative "deck"
require_relative "hand"

class BlackjackGame

  def initialize 
    @deck = Deck.new.shuffle 
    @wallet = "100"
  end 

  def run 
    puts "Welcome to a game of BlackJack"
    puts "What is your name?"

    input = gets
    @name = input.chomp.capitalize 

    puts "Welcome, #{@name}!"

    puts "You have $#{@wallet} starting out and each round you will bet $10."
    
    puts "Lets begin, you bet $10"

    hand = Hand.new
    2.times do 
      hand.player_hand << @deck.shift 
    end

    puts "Your cards are #{hand.cards} with the total of #{hand.total}"

    puts "Would you like to (h)it or (s)tay?"
  end

end

BlackjackGame.new.run





# Hint: for starters, read bin/blackjack.rb