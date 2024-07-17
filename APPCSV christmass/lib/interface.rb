require_relative "christmas"
require_relative "scraper"
require_relative "storing"

# Pseudo-code :
# 1. Bienvenue
  # afficher le message de bienveu sur la christma list
puts "\n"
puts "*" * 31
puts "*#{' ' * 29}*"
puts "*    🎄 Christmas List 🎄     *"
puts "*#{' ' * 29}*"
puts "*" * 31
# on commence la boucle
filepath = 'data/list.csv'
action = ""
gift_list = load_csv(filepath)
while action != "quit"
  # 2. Affiche le menu (list / add / delete / mark / quit)
  puts "Which action [list|add|mark|delete|ideas|quit]?"
  # demander l'action a executer
  print ">"
  # 3. Obtenir l'action utilisateur
  action = gets.chomp
  # 4. Effectuer la bonne action
    # tester le choix de l utilsiateur => if /elsif test== 'action' OU case action when '????'
  case action.downcase
  when 'list'
    list(gift_list)
  when 'add'
    #  demander au user le nom du kdo
    # recuperer le nom du kdo
    # ajouter à liste du kdo
    puts "What item do you want to add your to gift list"
    print ">"
    gift_list << {name: gets.chomp, bought: false}
    save_csv(gift_list, filepath)
  when 'delete'
    # afficher la liste
    # deamnder quel items souhaitez vous supprimer
    # recuperer la reponse (index)
    # effacer le kado de la liste en utilsiant le réponse
    list(gift_list)
    puts " What gift do you want to remove from the liste (give the number)?"
    print ">"
    index = gets.chomp.to_i
    gift_list.delete_at(index - 1)
    save_csv(gift_list, filepath)
  when 'quit'
    # afficher le message goodbye
    puts "Goodbye"
  when 'mark'
    # afficher la liste
    # demander quel item souhaitez vous mark
    # recupere la reponse (index)
    # aller cherche bon gift
    # modifier la valeur de la key :bought => true
    list(gift_list)
    puts "Which item have you bought (give the index)?"
    print ">"
    index = gets.chomp.to_i - 1
    gift_list[index][:bought] = true
    save_csv(gift_list, filepath)
  when "ideas"
    # deamnder à lutilsiateur ce qu il veut
    puts "What are you looking for on Etsy?"
    print ">"
    # "What are you looking for on Etsy?""
    user_choice = gets.chomp
    # on appelle la methode scraper(le resulta du user) => la methode scraper doit me renvoyer un array
    ideas = scraper(user_choice)
    puts "Here are Etsy results for #{user_choice}:"
    ideas.each_with_index do |idea, index|
      puts "#{index + 1 } - #{idea}"
    end
    puts "Pick one to add to your list (by number)"
    print '>'
    index = gets.chomp.to_i - 1
    new_gift = {
      name: ideas[index],
      bought: false
    }
    gift_list << new_gift
    puts "#{new_gift[:name]} added to your wishlist"
    save_csv(gift_list, filepath)
    # avec des nom de gift
    # on afficher les choix gift (avec index)
    # demander au user de "Pick one to add to your list (give the number)"
    # recuperer le choix (un index)
    # on va creer un new_gift avec le nom du choix {name: "le nom", bought: false}
    # on le rajoute à gift_list << new_gift
    # on affiche "le nom du gift" added to your wishlist
  else
    puts " Choose an existing action  :) !!!"
  end
  # et en fonction de ce choix effectuer la bonne action. puts "TODO"
# fin boucle
end
