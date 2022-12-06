# PUZZLE 1
# Leer archivo
file = File.open('advent_of_code/input1.txt')

# Convertir los datos a array por el delimitador \n
raw_string = file.readlines.map(&:chomp)

# Limpiar el array y crear subarrays con los datos que estan antes de un ""
new_a = raw_string.slice_before('').to_a

# Eliminar los espacios '' dentro de los subarrays
new_a.map { |array| array.keep_if { |element| element != '' } }

# Convertir los numeros de strings a integers
new_a.map! { |sub_array| sub_array.map(&:to_i) }

# Sumar los elementos de los subarrays dentro del array
def sum_elements(array)
  array.map { |sub_array| sub_array.reduce(:+) }
end

p sum_elements(new_a).sort.last(3).reduce(:+)
