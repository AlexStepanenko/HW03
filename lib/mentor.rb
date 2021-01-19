require_relative 'person'

class Mentor < Person
  attr_accessor :students

  def initialize(**args)
    super

    @students = []
  end

  def subscribe_to!(student)
    students.push(student)
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description, mentor: self, student: student)
    student.add_homework!(homework)
    student.notify("HW #{homework.title} was added.")
    homework
  end

  def reject_to_work!(homework)
    homework.status = 'rejected'
    homework.student.notify("HW #{homework.title} was rejected.")
  end

  def accept!(homework)
    homework.status = 'accepted'
    homework.student.notify("HW #{homework.title} was accepted.")
  end
end
