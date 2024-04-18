class Suica
  attr_writer :balance

  # 預かり金
  DEPOSIT = 500
  # 最小チャージ額
  MINIMUM_CHARGE_MONEY = 100

  def initialize
    @balance = DEPOSIT
  end

  # チャージ
  def charge(charge_moeny)
    if charge_moeny < MINIMUM_CHARGE_MONEY
      puts "#{MINIMUM_CHARGE_MONEY}以下の金額はチャージできません。"
    else
      add_balance(charge_moeny)
    end
  end

  # 残高を増やす
  def add_balance(purchased_money)
    @balance += purchased_money
  end

  # 残高を減らす
  def del_balance(purchased_money)
    @balance -= purchased_money
  end

  # 残高取得
  def now_balance
    @balance
  end

  def puts_balance
    "Suica残高 : #{@balance}円"
  end
end
