# crer un methode list
def list(list)
  list.each_with_index do |kdo, index|
    puts "#{index + 1} -#{kdo[:bought] ? "[X]" : "[ ]"}- #{kdo[:name]}"
  end
end

# condition (true/false) ? code si vrai : code si faux
# if condition
#   code si vrai
# else
#   code si faux
# end
