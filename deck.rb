class Deck
  attr_reader :cards

  def initialize
    @cards = form_deck
  end

  def draw_card
    [@cards.pop].to_h
  end

  private

  def form_deck
    symbols = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    suits = %w[+ <3 <> ^]
    values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

    cards = []
    suits.each do |suit|
      cards += symbols.map { |symbol| symbol + suit }.zip(values)
    end

    cards.shuffle
  end
end
