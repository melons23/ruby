require './pokemon'

class Pikachu < Pokemon

  def attack
    super
    puts "#{@name}の10万ボルト!"
  end

end
