class Player
  def initialize(name = '', role)
    @name = name
    @role = role
    @bank = Bank.new(100, role)
    @cards = []
  end
end
