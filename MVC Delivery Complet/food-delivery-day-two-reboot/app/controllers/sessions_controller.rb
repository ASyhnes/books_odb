require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # 1. demander et stocker le username (~> vue!!!)
    username = @sessions_view.ask_for(:username)
    # 2. demander et stocker le password
    password = @sessions_view.ask_for(:password)
    # 3. chercher l'employee dont le username correspond (~> employee repository)
    employee = @employee_repository.find_by_username(username)
    # 4 si je trouve bien un employee et que son password matche, alors je retourne employee
    if employee && password == employee.password
      @sessions_view.welcome(employee)
      return employee
    end
    # 5 sinon, j'affiche le message "mauvais identifiants"
    @sessions_view.wrong_credentials
  end
end
