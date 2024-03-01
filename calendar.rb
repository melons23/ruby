# frozen_string_literal: true

require 'date'
require 'optparse'

MINMONTH = 1
MAXMONTH = 12
SUNDAY = 0

def put_month
  opt = OptionParser.new
  opt.on('-m')
  opt.parse!(ARGV)
  month = ARGV.slice(0).to_i

  if month.zero?
    DateTime.now.month
  else
    month
  end

end

def calendar_header(date)
  puts "#{date.month}月 #{date.year}".center(20)
  week = %w[月 火 水 木 金 土 日]
  puts week.join(' ')
end

def calendar_body(start_date, end_date)
  breaks = if start_date.wday.to_i == SUNDAY
             '   ' * 6
           else
             '   ' * (start_date.wday.to_i - 1)
           end
  print breaks

  (start_date..end_date).each do |day|
    print "#{day.day.to_s.rjust(2)}\s"
    print "\n" if day.sunday?
  end
  puts "\n"
end

if put_month.between?(MINMONTH, MAXMONTH) then

  dateset = Date.new(2024, put_month, 1)
  calendar_header(dateset)

  star_date = Date.new(dateset.year, dateset.month, 1)
  end_date = Date.new(dateset.year, dateset.month, -1)
  calendar_body(star_date, end_date)
  
else
  puts "#{put_month} is neither a month number (1..12) nor a name"
end