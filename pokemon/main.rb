require './pokemon'
require './pikachu'

# ピカチュウの攻撃
pikachu = Pikachu.new("ピカチュウ", "でんき", nil, 35)
puts pikachu.attack

# 名前を変更する
pokemon = Pokemon.new('ピカチュウ', 'でんき', nil, 35)
puts pokemon.change_name('てきせつ')
puts pokemon.put_name

#　不適切な名前の場合
puts pokemon.change_name('うんこ')
puts pokemon.put_name
