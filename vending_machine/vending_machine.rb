require_relative 'juice'
require_relative 'suica'

class VendingMachine
  attr_reader :suica
  private attr_writer :amount

  def initialize
    @juice_stock = [
      {juice: Juice.new('ペプシ', 150), count: 5},
      {juice: Juice.new('モンスター', 230), count: 5},
      {juice: Juice.new('いろはす', 120), count: 5}
    ]
    @total_sales_money = 0
  end

  # 在庫を増やす
  def add_stock(juice_name, increase_by)
    juice = find_juice(juice_name)
    juice[:count] += increase_by if juice
  end

  # 在庫を減らす
  def remove_stock(juice_name, decrease_by)
    juice = find_juice(juice_name)
    juice[:count] -= decrease_by if juice
  end

  # 売上金額を増やす
  def add_amount(purchased_money)
    @total_sales_money += purchased_money
  end

  # 在庫取得
  def stock(juice_name)
    juice = find_juice(juice_name)
    "#{juice_name}の在庫は#{juice[:count]}本です。"
  end

  # 購入
  def buy(juice_name, suica)
    juice = find_juice(juice_name)
    raise '在庫がありません' if juice[:count].nil?
    raise 'Suicaの残高が不足しています' if juice[:juice].money > suica.now_balance

    # 購入後の処理
    # ①在庫を減らす
    remove_stock(juice[:juice].name, 1)
    # ②売上金額を増やす
    add_amount(juice[:juice].money)
    # ③Suicaの残高を減らす
    suica.del_balance(juice[:juice].money)

  end

  # ドリンクリスト取得
  def juice_list
    @juice_stock.map { |juice| "・#{juice[:juice].name}" }
  end

  # 現在の売上金額取得
  def now_amount
    "売上金額 : #{@total_sales_money}円"
  end

  # 商品検索
  def find_juice(juice_name)
    @juice_stock.find{ |juice| juice[:juice].name == juice_name }
  end
end
