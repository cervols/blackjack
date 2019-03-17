class Player
  attr_reader :bank, :name
  attr_accessor :cards

  def initialize(name, role)
    @name = name
    @role = role
    @bank = Bank.new(100, role)
  end

  def calculate_points
    cards_values = cards.values
    points = cards_values.sum

    if points > 21
      index_of_ace = cards_values.index(11)
      if index_of_ace
        cards_values[index_of_ace] = 1
        points = cards_values.sum
      end
    end

    points
  end
end
