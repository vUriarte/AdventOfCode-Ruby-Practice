file_name = 'input.txt'

class DayOne
  @@digits_hash_table = {
    '0' => 'zero',
    '1' => 'one',
    '2' => 'two',
    '3' => 'three',
    '4' => 'four',
    '5' => 'five',
    '6' => 'six',
    '7' => 'seven',
    '8' => 'eight',
    '9' => 'nine'
}.freeze

  def initialize(file_path)
    @file_path = file_path
  end

  def solve_first_case()
    sum = 0
    File.foreach( @file_path ) do |line|
      digits = line.scan(/\d/)
      
      first_digit = digits.first
      last_digit = digits.last

      calibration_line_value = first_digit + last_digit
      sum += calibration_line_value.to_i
      
      puts "“line: #{line}"
      puts "“firstDigit: #{first_digit}"
      puts "“lastDigit: #{last_digit}"
      puts "“calibrationLineValue: #{calibration_line_value}"
      puts "_____"
      puts "“total sum: #{sum}"
    end
  end

  def solve_second_case()
    sum = 0
    reg = Regexp.new("(?=(#{@@digits_hash_table.values.join('|')}|\\d))".freeze) 
    File.foreach( @file_path ) do |line|
      matchdata = line.scan(reg)

      first_digit = @@digits_hash_table.key(matchdata.first.first) || matchdata.first.first
      last_digit = @@digits_hash_table.key(matchdata.last.last) || matchdata.last.last

      calibration_line_value = first_digit + last_digit
      sum += calibration_line_value.to_i
  
      puts "“line: #{line}"
      puts "“firstDigit: #{first_digit}"
      puts "“lastDigit: #{last_digit}"
      puts "“calibrationLineValue: #{calibration_line_value}"
      puts "“total sum: #{sum}"
      puts "____"
    end
  end
end


first_case = DayOne.new(file_name)
first_case.solve_first_case()

second_case = DayOne.new(file_name)
second_case.solve_second_case()