class Gradebook

  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_students
    @courses.map do |course|
      course.students
    end.flatten
  end

  def list_students_below_grade(grade)
    list_all_students.select do |student|
      student.grade < grade
    end
  end
end