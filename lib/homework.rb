class Homework
  attr_accessor :title, :description, :mentor, :student, :status, :answer

  def initialize(title, description, mentor:, student:)
    @title = title
    @description = description
    @mentor = mentor
    @student = student
    @status = 'new'
    @answer = nil
  end
end
