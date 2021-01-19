require_relative 'person'

class Student < Person
  attr_accessor :homeworks

  def initialize(**args)
    super

    @homeworks = []
  end

  def add_homework!(homework)
    homeworks.push(homework)
  end

  def to_work!(homework)
    homework.status = 'in_progress'
    homework.mentor.notify("HW #{homework.title} was taken to work.")
  end

  def add_answer!(homework, text)
    homework.answer = text
    homework.mentor.notify("HW #{homework.title} was taken to work.")
  end

  def to_check!(homework)
    homework.status = 'to_check'
    homework.mentor.notify("HW #{homework.title} is ready for checking.")
  end
end
