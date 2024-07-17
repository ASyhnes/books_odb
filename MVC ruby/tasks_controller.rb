require_relative 'view'
require_relative 'task'

class TasksController
  def initialize(repo)
    @tasks_repository = repo
    @view = View.new
  end

  def list
    @view.display_list(@tasks_repository.all)
  end

  def create
    # demander a u lutilisateur le nom de la nouvelle tache?
    @view.ask_user("Quelle tâche souhaitez vous ajouter?")
    # recuperere le nom d ela nouvella tache.
    task_name = @view.get_user_choice
    # creer un instance task avec le nom
    task = Task.new(task_name)
    # ajoute au repo.create
    @tasks_repository.add(task)
  end

  def mark_as_done
    # afficher la liste
    @view.display_list(@tasks_repository.all)
    # damnder quel tache est effectuée
    @view.ask_user("Quelle tâche avez vous effectuée? (donnez son Nb)")
    # on recupere l'index
    index = @view.get_user_choice.to_i - 1
    # on recupere la tache
    task = @tasks_repository.find(index)
    # on la mark_as_done
    task.mark_as_done!
  end

  def delete
    # afficher la liste
    @view.display_list(@tasks_repository.all)
    # damnder quel tache est effectuée
    @view.ask_user("Quelle tâche souhaitez vous effacer? (donnez son Nb)")
    # on recupere l'index
    index = @view.get_user_choice.to_i - 1
    # call destroy method on repo
    @tasks_repository.destroy(index)
  end

end
