file = File.open('advent_of_code/input3.txt')
elements = file.readlines.map(&:chomp)
scores = [*"a".."z", *"A".."Z"].zip(1..52).to_h

total_sum = 0
# # Dividir cada string en dos partes iguales
# elements.map! { |element| element.chars.each_slice(element.size / 2).map(&:join) }
# # Convertir cada string a array
# elements.map! { |array| array.map!(&:chars) }
# # Encontrar el elemento en comun
# elements.map! { |array| array.map{ |subarray| subarray.intersection(array[1]) } }
# # Solo guardar los elementos en comun y quitar los arrays originales
# elements.map! { |array| array.keep_if { |subarray| subarray.size == 1 }}.flatten!
# # Calcular la suma
# elements.each { |letter| total_sum += scores[letter]}

# PARTE 2
# elements.map! { |element| element.chars.each_slice(element.size / 2).map(&:join) }
# Convertir cada string a array
# elements.map! { |array| array.map!(&:chars) }
# elements.each_slice(3) { |group| group.each { |subgroup| print "*****" + subgroup.to_s } }

letters = []
elements.map!(&:chars).each_slice(3) { |x, y, z| letters << x.intersection(y, z) }
letters.flatten!

letters.each { |letter| total_sum += scores[letter] }

p total_sum
