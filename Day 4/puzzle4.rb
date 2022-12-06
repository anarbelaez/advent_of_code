file = File.open('advent_of_code/Day 4/input4.txt')
ranges = file.readlines.map!(&:chomp)
ranges.map! { |group| group.split(',') }

# PARTE 1
total_sum = 0
ranges.each do |array|
  x_first = array[0].split('-').first.to_i
  x_last = array[0].split('-').last.to_i
  y_first = array[1].split('-').first.to_i
  y_last = array[1].split('-').last.to_i
  conditions1 = (y_first >= x_first && y_first <= x_last && y_last >= x_first && y_last <= x_last)
  conditions2 = (y_first <= x_first && y_first <= x_last && y_last >= x_first && y_last >= x_last)
  total_sum += 1 if conditions1 || conditions2
end

p total_sum
