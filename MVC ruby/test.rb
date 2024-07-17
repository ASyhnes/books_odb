require_relative 'task'
require_relative 'repository'
require_relative 'view'
require_relative 'controller'
require_relative 'router'


router = Router.new(tasks_controller)
router.run
# menage = Task.new("Menage")
# tarots = Task.new("Tarots")
# tasks_repository.create(menage)
# tasks_repository.create(tarots)
#  tasks_controller.list
#  tasks_controller.add
# #  tasks_controller.list
#  tasks_controller.mark_as_done
#  tasks_controller.delete
#  tasks_controller.list
# p menage.is_done?
# p menage.name
# menage.mark_as_done
# p menage.is_done?
# p tasks_repository.all
# p tasks_repository.find(0)
# tasks_repository.destroy(0)
# p tasks_repository.all
# tasks_view = View.new
# tasks_view.ask_user("Quel est le nom de la tâche à ajouter ?")
# tasks_view.get_user_choise
# tasks_view.display_list(tasks_repository.all)
