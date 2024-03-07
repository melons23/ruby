class Golf 
  
  def initialize(defalut_stroke, stroke)
    @defalut_stroke = defalut_stroke
    @stroke = stroke
    @score_output = []
    @score_hash = { 0 => "パー", 1 => "バーディ", 2 => "イーグル", 3 => "アルバトロス", 4 => "コンドル" }
  end

  def score

    @defalut_stroke.zip(@stroke) do |x, y|

      if x < y then
        judgePlus(x, y)
      else
        judgeMinus(x, y)
      end

    end

    @score_output

  end

  def judgePlus(x, y)
    if y == (x + 1) then
      @score_output << "ボギー"
    elsif y >= (x + 2) then
      @score_output << "#{y - x}ボギー"
    end
  end

  def judgeMinus(x, y)

    if y == 1 && x != 5
      @score_output << "ホールインワン"
      return
    end

    if (0..4).include?(x - y)
      @score_output << @score_hash[x - y]
    end

  end

end

# 2行の入力を受け取る
input_lines = 2.times.map { gets.chomp }

# 各行をカンマで区切って配列に変換し、整数に変換して配列に追加
numbers = input_lines.map { |line| line.split(",").map(&:to_i) }
defalut_stroke = numbers[0]
stroke = numbers[1]

golf_score = Golf.new(defalut_stroke, stroke)
puts golf_score.score.join(',')