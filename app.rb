require_relative 'lib/notification'
require_relative 'lib/homework'
require_relative 'lib/mentor'
require_relative 'lib/student'


student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

p student
p mentor
puts

homework = mentor.add_homework(title: 'HW03', description: 'description homework', student: student)
p homework
puts

p student.notifications.map(&:message)
puts

student.mark_as_read!

p student.notifications.map(&:message)
puts

mentor.subscribe_to!(student)
p mentor.students

p student.homeworks.size

student.to_work!(homework)
p homework.status
p student.homeworks.size

p mentor.notifications.map(&:message)
mentor.mark_as_read!
p mentor.notifications.map(&:message)

student.add_answer!(homework, 'new students answer')
p homework.status
p homework.answer

mentor.mark_as_read!

student.to_check!(homework)
p homework.status
p homework.answer
p mentor.notifications.map(&:message)

mentor.reject_to_work!(homework)
mentor.mark_as_read!
p student.notifications.map(&:message)


student.mark_as_read!
student.add_answer!(homework, 'new students answer_after reject')
student.to_check!(homework)

p mentor.notifications.map(&:message)
mentor.accept!(homework)
p student.notifications.map(&:message)

p homework.status
p homework.answer
