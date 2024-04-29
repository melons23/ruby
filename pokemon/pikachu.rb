require './pokemon'

class Pikachu < Pokemon

  def initialize(name, type1, type2, hitpoint)
    super(name, type1, type2, hitpoint)
  end

  def attack
    super
    puts "#{@name}の10万ボルト!"
  end

end
