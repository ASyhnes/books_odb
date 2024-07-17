class View
  def display_list(recipes)
    # iterer sur l'array de recipes et afficher le detail joliment
    puts "*"*20
    puts "Here is your recipes list"
    recipes.each_with_index do |recipe, index|
      puts "#{index +1}. #{recipe.name} - #{recipe.description}"
    end
    puts "*"*20
  end

  def ask_user_for(question)
    puts question
    print ">"
  end

  def ask_user_choice
    gets.chomp
  end
end
