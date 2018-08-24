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

    @hand = Hand.new
    2.times do 
      @hand.player_hand << @deck.shift 
    end

    puts "Your cards are #{@hand.cards} with the total of #{@hand.total}"

    # @hand.busted?
    player_hit_loop
    
  end


  #********************HIT methods****************************
  def hit
    @hand.player_hand << @deck.shift 
    puts "Your new hand is the #{@hand.cards} with a total of #{@hand.total}"
  end

  def dealer_hit
    @dealer_hand.player_hand << @dealer_deck.shift
  end 

  #**************************stand methods**********************

  def stand 
    puts "You stand with the #{@hand.cards} and a total of #{@hand.total}"
  end
  

  #************setting up dealer deck and hand and turn****************
  def dealer_turn
    @dealer_deck = Deck.new.shuffle

    @dealer_hand = Hand.new
    2.times do 
      @dealer_hand.player_hand << @dealer_deck.shift 
    end 
    while @dealer_hand.total < 17
      dealer_hit
         if dealer_hand.busted?
          puts "The Dealer busted and you win the round"
          @wallet = @wallet.to_i +10 
         end
     end
  end

  # ********** player loop ************
  def player_hit_loop 
    @answer = ''
    while @answer != "s"
      puts "Would you like to (h)it or (s)tand?"
      @answer = gets.chomp
      if @answer == "h"
        hit
        if @hand.busted?
         puts "Sorry, you busted"
         @wallet = @wallet.to_i - 10
         puts "You now have #{@wallet} in your wallet"
          return
        end
      elsif @answer == "s"
        stand
      end
    end

  end 


end

BlackjackGame.new.run





# Hint: for starters, read bin/blackjack.rb