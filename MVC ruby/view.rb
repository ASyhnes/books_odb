class View
  def ask_user(truc)
    puts truc
    print ">"
  end
  def get_user_choice
    gets.chomp
  end
  def display_list(list)
    puts " YOUR TODO LIST"
    list.each_with_index do |task,index|
      puts "#{index + 1} - #{task.is_done? ? '[X]' : '[ ]'} - #{task.name}"
    end
  end
end
