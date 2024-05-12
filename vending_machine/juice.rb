class Juice
  attr_reader :name, :money
  attr_writer :stock

  def initialize(name, money)
    @name = name
    @money = money
  end

end
