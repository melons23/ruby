require_relative 'juice'
require_relative 'suica'
require_relative 'vending_machine'

pepsi = 'ペプシ'
irohasu = 'いろはす'
monster = 'モンスター'

suica = Suica.new
vending_machine = VendingMachine.new

# ---在庫補充
vending_machine.default_juice(Juice.new('ペプシ', 150, 5))
vending_machine.default_juice(Juice.new('モンスター', 230, 5))
vending_machine.default_juice(Juice.new('いろはす', 120, 5))

# ---ステップ1
# Suicaに100円以上の金額をチャージする
# suica.charge(100)
puts "残高は#{suica.now_balance}円です。"

# 100円未満のチャージであれば例外を発生させる
suica.charge(1500)

# Suicaは現在のチャージ残高を取得できる
puts "現在の残高は#{suica.now_balance}円です。"

# ---ステップ2
# 初期状態で、ペプシ(150円)を5本格納する
# vending_machine.default_juice(Juice.new(pepsi, 150, 5))

# 自動販売機は在庫を取得できる
puts vending_machine.stock(pepsi)

# ---ステップ3
# ペプシを購入する
vending_machine.buy(pepsi, suica)
vending_machine.buy(monster, suica)
vending_machine.buy(irohasu, suica)

# ペプシの在庫が1本減る
puts vending_machine.stock(pepsi)
# 売上金額が増えたことを確認
puts vending_machine.now_amount
# # Suicaの残高が減ったことを確認
puts suica.puts_balance

# ドリンクリスト取得
puts vending_machine.drink_list

# 在庫補充
vending_machine.add_stock(monster, 100)

puts vending_machine.stock(monster)
