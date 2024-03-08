class Golf
  def initialize(defalut_stroke, stroke)
    @defalut_stroke = defalut_stroke
    @stroke = stroke
    @score_output = []
    @score_hash = { 0 => 'パー', 1 => 'バーディ', 2 => 'イーグル', 3 => 'アルバトロス', 4 => 'コンドル' }
  end

  def score

    @defalut_stroke.zip(@stroke) do |provision_stroke, player_stroke|

      if provision_stroke < player_stroke
        judge_plus(provision_stroke, player_stroke)
      else
        judge_minus(provision_stroke, player_stroke)
      end

    end

    @score_output

  end

  def judge_plus(provision_stroke, player_stroke)
    if player_stroke == (provision_stroke + 1)
      @score_output << 'ボギー'
    elsif player_stroke >= (provision_stroke + 2)
      @score_output << "#{player_stroke - provision_stroke}ボギー"
    end
  end

  def judge_minus(provision_stroke, player_stroke)

    if player_stroke == 1 && provision_stroke != 5
      @score_output << 'ホールインワン'
      return
    end

    @score_output << @score_hash[provision_stroke - player_stroke] if (0..4).cover?(provision_stroke - player_stroke)

  end

end

# 2行の入力を受け取る
input_lines = Array.new(2) { gets.chomp }

# 各行をカンマで区切って配列に変換し、整数に変換して配列に追加
numbers = input_lines.map { |line| line.split(',').map(&:to_i) }
defalut_stroke = numbers[0]
stroke = numbers[1]

golf_score = Golf.new(defalut_stroke, stroke)
puts golf_score.score.join(',')
