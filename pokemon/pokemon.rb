class Pokemon
  private attr_writer :name
  attr_reader :name, :type1, :type2, :hitpoint

  NGWORD = 'うんこ'

  def initialize(name, type1, type2, hitpoint)
    @name = name
    @type1 = type1
    @type2 = type2
    @hitpoint = hitpoint
  end

  # ポケモンの攻撃
  def attack
    puts "#{@name}のこうげき!"
  end

  # ポケモンの名前を変更する
  # 不適切な名前の場合は変更しない
  def change_name(new_name)
    return '不適切な名前です。' if new_name == NGWORD

    @name = new_name
  end

  def put_name
    @name
  end

end
