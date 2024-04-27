require_relative 'juice'
require_relative 'suica'

class VendingMachine
  attr_reader :suica
  private attr_writer :amount

  def initialize
    @stock = []
    @amount = 0
  end

  # 初期在庫補充
  def default_juice(juice)
    @stock << juice
  end

  # 在庫を増やす
  def add_stock(juice, increase_by)
    find_juice(juice).stock += increase_by if find_juice(juice).name == juice
  end

  # 在庫を減らす
  def remove_stock(juice, decrease_by)
    find_juice(juice).stock -= decrease_by if find_juice(juice).name == juice
  end

  # 在庫取得
  def stock(juice)
    "#{find_juice(juice).name}の在庫は#{find_juice(juice).stock}本です。"
  end

  # 売上金額取得
  def add_amount(purchased_money)
    @amount += purchased_money
  end

  # 購入
  def buy(juice, suica)
    purchase_juice = find_juice(juice)
    raise '在庫がありません' if purchase_juice.stock.nil?
    raise '金額が不足しています' if purchase_juice.money > suica.now_balance

    get_juice(purchase_juice, suica)

  end

  def get_juice(purchase_juice, suica)
    remove_stock(purchase_juice.name, 1)
    add_amount(purchase_juice.money)
    suica.del_balance(purchase_juice.money)
  end

  # ドリンクリスト
  def drink_list
    @stock.map { |juice| "・#{juice.name}" }
  end

  def now_amount
    "売上金額 : #{@amount}円"
  end

  def find_juice(juice_name)
    @stock.find{ |item| item.name == juice_name }
  end
end
