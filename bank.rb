class Bank
  attr_accessor :money

  def initialize(sum, player)
    @money = sum
    @owner = player
  end
end
