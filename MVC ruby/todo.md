## Client demand: task manager
- User stories:
  - list tasks
  - add a task
  - mark a task as done
  - remove a task
## define your class
- la plus petite entité ? => MODEL (aka Class) :
  - Task
  data:
    - @done (boolean)
    - @description (String)
    - @name (String)
  - BEHAVIOURS
    - mark_as_done
    - is_done?
    - #description => get @description
    - #name => get @name
- pour gerer la mémoire ? => class Repository
  - data:
    - @tasks = []
  - BEHAVIOURS
    - create (task)
    - destroy(index)
    - all()
    - find(index)
- pour gérér les demandes au user et récupérer les infos? =>
    - data:
    - behaviours:
      - aks_user(descrition)
      - get_user_choice (gets.chomp )
      - get_index (gets.chomp name)
      - display_list(list)

- pour gerer les actions => TasksController
  - data :
     - le repo

  - Behaviours:
    -  les actions des User Stroies
