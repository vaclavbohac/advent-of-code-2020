class CountBasedPasswordValidator
  def self.valid_password?(password, letter, range)
    range.include?(password.count(letter))
  end
end

class PositionBasedPasswordValidator
  def self.valid_password?(password, letter, positions)
    matched_positions = positions.count do |position|
      password[position - 1] == letter
    end

    matched_positions == 1
  end
end

File.open('input.txt') do |f|
  lines = f.readlines.map(&:to_s)

  valid_passwords = lines.each_with_object(count_based: 0, position_based: 0) do |line, results|
    x, y, letter, password = line.match(/(\d+)-(\d+) (\S): (\S+)/).captures

    results[:count_based] += 1 if CountBasedPasswordValidator.valid_password?(password, letter, (x.to_i..y.to_i))
    results[:position_based] += 1 if PositionBasedPasswordValidator.valid_password?(password, letter, [x, y].map(&:to_i))
  end

  puts valid_passwords
end
