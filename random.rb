class Random
  def initialize(group, number)
    @group = group
    @number = number
  end

  def split
    [@group[0..@number - 1].sort.to_a, @group[@number..5].sort.to_a]
  end
end

group = ('A'..'F').to_a
number = [2, 3]
result = Random.new(group.shuffle, number.sample).split

result.each do |half|
  p half
end
