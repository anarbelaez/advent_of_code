# Leer el archivo
file = File.open('advent_of_code/Day2/input1.txt')
# Obtener un array con los valores
all_combinations = file.readlines.map(&:chomp)

# Definir los score de cada combinacion
SCORES = {
  'A X' => 4,
  'A Y' => 8,
  'A Z' => 3,
  'B X' => 1,
  'B Y' => 5,
  'B Z' => 9,
  'C X' => 7,
  'C Y' => 2,
  'C Z' => 6
}

# # Obtener el numero de veces que aparece una combinacion
# # 1. Inicializar el hash
# combinations_hash = Hash.new { |h,k| h[k] = 0 }

# # 2. Llenar el hash con el numero de veces que aparece una combinacion
# all_combinations.each {|combination| combinations_hash[combination] += 1 }

# # Realizar el producto de este conteo de cada combinacion y su respectivo score
# combinations_hash.map { |k, v| combinations_hash[k] = v * SCORES[k] if SCORES.key? k }

# # Suma de los values
# combinations_hash.values.reduce(:+)

# SEGUNDA PARTE DEL EJERCICIO

# Hacemos el cambio de estrategia
all_combinations.map! do |combination|
  case combination
  when "A X"; "A Z"
  when "A Y"; "A X"
  when "A Z"; "A Y"
  when "C X"; "C Y"
  when "C Y"; "C Z"
  when "C Z"; "C X"
  else combination
  end
end

# Obtener el numero de veces que aparece una combinacion
# 1. Inicializar el hash
combinations_hash = Hash.new { |h, k| h[k] = 0 }

# 2. Llenar el hash con el numero de veces que aparece una combinacion
all_combinations.each { |combination| combinations_hash[combination] += 1 }

# Realizar el producto de este conteo de cada combinacion y su respectivo score
combinations_hash.map { |k, v| combinations_hash[k] = v * SCORES[k] if SCORES.key? k }

# Suma de los values
p combinations_hash.values.reduce(:+)
