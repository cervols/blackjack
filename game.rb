class Game
  BET = 10
  MAX_CARDS_NUMBER = 3

  def initialize(interface)
    @interface = interface
    @bank = Bank.new(0, 'casino')
  end

  def run
    @interface.welcome
    create_players
    main_menu
  end

  private

  def create_players
    @interface.ask_user_name
    @user = User.new(user_input)
    @dealer = Dealer.new
  end

  def main_menu
    @interface.show_main_menu
    choice = user_input
    case choice
    when '0'
      @interface.goodbye
      exit
    when '1'
      start_new_game
    else
      @interface.dont_understand(choice)
      main_menu
    end
  end

  def user_input
    @interface.user_answer
  end

  def start_new_game
    if @dealer.bank.money < BET || @user.bank.money < BET
      @interface.not_enough_money
      @interface.pause

      main_menu
    else
      @user.cards = {}
      @dealer.cards = {}
      @deck = Deck.new
      make_bets

      @user.cards.merge!(@deck.draw_card).merge!(@deck.draw_card)
      @dealer.cards.merge!(@deck.draw_card).merge!(@deck.draw_card)

      points_info

      player_move_menu
    end
  end

  def make_bets
    @dealer.bank.money -= BET
    @user.bank.money -= BET
    @bank.money += BET * 2
  end

  def player_move_menu
    loop do
      @interface.show_player_move_menu
      choice = user_input
      case choice
      when '1'
        dealer_move
        finish_game if maximum_cards_number?
      when '2'
        take_card(@user)
        if maximum_cards_number?
          finish_game
        else
          points_info
          dealer_move
        end
      when '3'
        finish_game
      else
        @interface.dont_understand(choice)
      end
    end
  end

  def dealer_move
    dealer_points = @dealer.calculate_points
    if dealer_points >= 17
      player_move_menu
    else
      take_card(@dealer)
    end
  end

  def take_card(user)
    if user.cards.count > 2
      @interface.too_many_cards
      return
    end
    user.cards.merge!(@deck.draw_card)
  end

  def maximum_cards_number?
    @user.cards.count == MAX_CARDS_NUMBER && @dealer.cards.count == MAX_CARDS_NUMBER
  end

  def points_info
    user_points = @user.calculate_points
    @interface.show_user_cards_info(@user.cards.keys, user_points)
    @interface.show_hidden_dealer_cards(@dealer.cards.count)
  end

  def finish_game
    user_points = @user.calculate_points
    dealer_points = @dealer.calculate_points

    if user_points > 21
      make_winner(@dealer)
      @interface.show_winner(@dealer.name)
    elsif dealer_points > 21
      make_winner(@user)
      @interface.show_winner(@user.name)
    elsif user_points > dealer_points
      make_winner(@user)
      @interface.show_winner(@user.name)
    elsif user_points < dealer_points
      make_winner(@dealer)
      @interface.show_winner(@dealer.name)
    else
      standoff
      @interface.standoff
    end

    @interface.show_user_cards_info(@user.cards, user_points)
    @interface.show_user_cards_info(@dealer.cards, dealer_points)
    @interface.show_money_info(@user.bank.money, @dealer.bank.money)

    @interface.pause

    main_menu
  end

  def make_winner(player)
    player.bank.money += @bank.money
    @bank.money = 0
  end

  def standoff
    @user.bank.money += BET
    @dealer.bank.money += BET
    @bank.money = 0
  end
end
