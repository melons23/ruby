class Juice
  attr_reader :name, :money, :stock
  attr_writer :stock
  def initialize(name, money, stock)
    @name = name
    @money = money
    @stock = stock
  end

end
