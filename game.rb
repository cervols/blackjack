class Game
  def initialize(interface, dealer, user)
    @interface = interface
    @dealer = dealer
    @user = user
    @bank = Bank.new(0, 'casino')
  end

  def run
    @interface.welcome
    create_players
    main_menu
  end

  private

  def create_players
    user_name = @interface.ask_user_name
    user = User.new(user_name)
    dealer = Dealer.new
  end
  
  def start_new_game
    @deck = Deck.new
    make_bets
    @user.cards << @deck.draw_card << @deck.draw_card
    @dealer.cards << @deck.draw_card << @deck.draw_card
  end

  def make_bets
    if @dealer.bank >= 10 && @user.bank >= 10
      @dealer.bank -= 10
      @user.bank -= 10
      @bank += 20
    else
      @interface.not_enough_money
      @interface.ask_start_new_game
    end
  end
end

