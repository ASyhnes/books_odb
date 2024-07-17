class Router
  def initialize(tasks_controller)
    @tasks_controller = tasks_controller
  end

  def run
    puts ' WELCOME TO YOUR TODO MANAGER'
    puts '#' * 20
    action = ''
    #  démarrer la boucle utilisateur
    while action != "quit"
    puts "What do you wanna do ? [list/add/mark/remove/quit] ?"
      action = gets.chomp
      do_action(action) # methode privée
    end
  end

  private

  def do_action(action)
    case action
      when "list"
        @tasks_controller.list
      when "add"
        @tasks_controller.create
      when "mark"
        @tasks_controller.mark_as_done
      when "remove"
        @tasks_controller.delete
      when "quit"
        puts " Good bye"
      else
        puts "Wrong action"
    end
  end
end
