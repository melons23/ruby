class Pokemon
  private attr_writer :name
  attr_reader :name, :type1, :type2, :hitpoint

  def initialize(name, type1, type2, hitpoint)
    @name = name
    @type1 = type1
    @type2 = type2
    @hitpoint = hitpoint
    @ngword = 'うんこ'
  end

  def attack
    puts "#{@name}のこうげき!"
  end

  def change_name(new_name)
    return '不適切な名前です。' if new_name == @ngword

    @name = new_name
  end

  def put_name
    @name
  end

end
