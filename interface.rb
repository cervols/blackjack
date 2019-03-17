class Interface
  def welcome
    puts 'Welcome to the Blackjack game!'
    separator
  end

  def ask_user_name
    puts 'Please enter your name'
  end

  def pause
    puts 'Press Enter to continue...'
    gets.chomp
  end

  def show_main_menu
    cls
    puts 'What do you want to do? Please, enter your choice and press Enter:'
    puts '1 - start new game'
    puts '0 - quit the program'
    separator
  end

  def show_player_move_menu
    puts 'What do you want to do? Please, enter your choice and press Enter:'
    puts '1 - stand (give a move to the Dealer)'
    puts '2 - hit (take a card)'
    puts '3 - show cards (finish the game)'
    separator
  end

  def user_answer
    gets.chomp
  end

  def dont_understand(choice)
    puts "You gave me '#{choice}' - I have no idea what to do with that."
    pause
  end

  def goodbye
    puts 'Goodbye!'
  end

  def not_enough_money
    puts 'Not enough money to continue the game.'
  end

  def too_many_cards
    puts 'Sorry, but player cannot have more than 3 cards.'
    pause
  end

  def show_user_cards_info(cards, points)
    puts cards
    puts "Points = #{points}"
  end

  def show_hidden_dealer_cards(cards_count)
    puts "Dealer's cards: #{'*' * cards_count}"
  end

  def show_winner(name)
    puts "Player #{name} won!"
  end

  def standoff
    puts 'No one is winner!'
  end

  def show_money_info(user_money, dealer_money)
    puts "User bank: $#{user_money}; dealer bank: $#{dealer_money}"
  end

  private

  def cls
    system('reset')
  end

  def separator
    puts '=' * 20
  end
end
