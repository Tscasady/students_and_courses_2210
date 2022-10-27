class UniversityData

  attr_reader :gradebooks

  def initialize()
    @gradebooks = []
  end

  def add_gradebook(gradebook)
    @gradebooks << gradebook
  end

  def list_all_students
    @gradebooks.map do |gradebook|
      gradebook.list_students
    end.flatten
  end

  def list_all_students_below_grade(grade)
    @gradebooks.map do |gradebook|
      gradebook.list_students_below_grade(grade)
    end.flatten
  end

end