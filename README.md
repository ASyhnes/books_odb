# Memo Ruby

## Introduction
Ce document est un mémo rapide pour les principales fonctionnalités de Ruby.

## Boucles

### Boucle `times`

```
3.times do |i| <br>
  puts "Iteration #{i}" <br>
end
```

### Boucle `for`

```
for i in 0...3
  puts "Iteration #{i}"
end
```

## Tableaux

### Créer un tableau vide

```
array = []
array = Array.new
```

### Ajouter des éléments à un tableau

```
array = []
array.push(1)
array << 2
array.push(3, 4)
```


### Additionner tous les éléments d'un tableau

```
array = [1, 2, 3, 4, 5]
somme = array.sum
puts "La somme des nombres du tableau est : #{somme}"
```

deuxiéme méthode, plus rapide: Calculer la somme des nombres de 1 à num

```
def summation(num)
  (1..num).sum
end
```

## Méthodes

### Vérifier si un nombre est un carré parfait

```
def is_square?(number)
  return false if number < 0
  sqrt = Math.sqrt(number)
  sqrt == sqrt.to_i
end
```

### Convertir une chaîne en majuscules

```
word = "bonjour"
capitalized_word = word.upcase
puts capitalized_word
```

### Diviser une chaîne de caractères en deux parties

```
full_name = "david chardon"
first_name, last_name = full_name.split
puts "First name: #{first_name}"
puts "Last name: #{last_name}"
```

### Obtenir les initiales d'un nom

```
def abbrev_name(name)
  first_name, last_name = name.split
  "#{first_name[0].upcase}.#{last_name[0].upcase}"
end


puts abbrev_name("david chardon") # Affiche "D.C"
puts abbrev_name("sophie hernandez") # Affiche "S.H"
```

### Calculer la somme des nombres de 1 à un nombre donné

```
def summation(num)
  (1..num).sum
end

puts summation(2)  # Affiche 3 (1 + 2)
puts summation(8)  # Affiche 36 (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8)
```

### Verifier si une lettre est en majuscule dans un string (3 méthode:)

1:
```
def contains_uppercase_each_char?(str)
  str.each_char do |char|
    return true if char == char.upcase && char =~ /[A-Z]/
  end
  false
end
```

2:
```
def contains_uppercase_match?(str)
  !!(str =~ /[A-Z]/)
end
```

3:
```
def contains_uppercase_scan?(str)
  str.scan(/[A-Z]/).any?
end
```

### "camelCasing"  =>  "camel Casing"

```
def solution(string)
result = ""

  string.each_char do |char|
    if char =~ /[A-Z]/
      result += " "
    end
    result += char
  end

  result
end
```
la même chose en version intelligente: 

```
def solution(string)
  string.gsub /([A-Z])/, ' \1'
end
```
