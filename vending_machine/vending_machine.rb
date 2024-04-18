require_relative 'juice'
require_relative 'suica'

class VendingMachine
  attr_reader :suica
  private attr_writer :amount

  def initialize(suica)
    @stock = []
    @amount = 0
    @suica = suica
  end

  # 初期在庫補充
  def default_juice(juice, count)
    @stock << {Juice: juice.name, Money: juice.money, Count: count}
  end

  # 在庫を増やす
  def add_stock(juice, increase_by)
    @stock.each do |item|
      item[:Count] += increase_by if item[:Juice] == juice
    end
  end

  # 在庫を減らす
  def remove_stock(juice, decrease_by)
    @stock.each do |item|
      item[:Count] -= decrease_by if item[:Juice] == juice
    end
  end

  # 在庫取得
  def stock(juice)
    juice = @stock.find { |item| item[:Juice] == juice }
    "#{juice[:Juice]}の在庫は#{juice[:Count]}本です。"
  end

  # 売上金額取得
  def add_amount(purchased_money)
    @amount += purchased_money
  end

  # 購入
  def buy(juice)
    purchase_juice = @stock.find { |item| item[:Juice] == juice }
    if purchase_juice.nil?
      puts '在庫がありません'
    elsif purchase_juice[:Money] > suica.now_balance
      puts '金額が不足しています'
    else
      get_juice(purchase_juice)
    end

  end

  def get_juice(purchase_juice)
    remove_stock(purchase_juice[:Juice], 1)
    add_amount(purchase_juice[:Money])
    suica.del_balance(purchase_juice[:Money])
  end

  # ドリンクリスト
  def drink_list
    drink_list = []
    @stock.each do |juice|
      drink_list << "・#{juice[:Juice]}"
    end
    drink_list
  end

  def now_amount
    "売上金額 : #{@amount}円"
  end

end
