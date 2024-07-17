class Task
    attr_reader :name

  def initialize(name)
    @done = false
    @name = name
  end

  def is_done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end
