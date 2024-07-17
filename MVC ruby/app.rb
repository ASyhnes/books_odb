
require_relative 'router'
require_relative 'repository'
require_relative 'tasks_controller'

tasks_repository = Repository.new
tasks_controller = TasksController.new(tasks_repository)

# instancier un router
router = Router.new(tasks_controller)
# lancer le router.run
router.run
