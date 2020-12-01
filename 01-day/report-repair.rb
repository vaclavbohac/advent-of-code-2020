class NotFound < StandardError; end

def report_repair(expenses, total)
  hash = {}

  expenses.each do |expense|
    remainder = total - expense

    return remainder * expense if hash.key?(remainder)

    hash[expense] = expense
  end

  raise NotFound
end

def report_repair_3sum(expenses, total)
  expenses.each do |expense|
    begin
      return report_repair(expenses - [expense], total - expense) * expense
    rescue NotFound
      next
    end
  end

  raise NotFound
end

File.open('input.txt') do |f|
  numbers = f.readlines.map(&:to_i)

  puts report_repair(numbers, 2020)
  puts report_repair_3sum(numbers, 2020)
end
