'require ./lib/gradebook'

RSpec.describe Gradebook do
  describe '#initialize' do
    it 'exists' do
      gradebook = Gradebook.new("Brian")

      expect(gradebook).to be_a Gradebook
    end

    it 'has an instructor' do
      gradebook = Gradebook.new("Jamison")

      expect(gradebook.instructor).to eq "Jamison"
    end

    it 'has an empty list of course by default' do
      gradebook = Gradebook.new("Mike")

      expect(gradebook.courses).to eq []
    end
  end

  describe '#add_course' do
    it 'can add a course to the course array' do
      gradebook = Gradebook.new("Brian")

      course_1 = Course.new("Calculus", 2) 
      course_2 = Course.new("History", 2) 

      gradebook.add_course(course_1)
      gradebook.add_course(course_2)

      expect(gradebook.courses).to eq [course_1, course_2]
    end
  end

  describe '#list_all_students' do
    it 'can return a list of students in all courses' do
      gradebook = Gradebook.new("Jamison")

      course_1 = Course.new("Calculus", 2) 
      course_2 = Course.new("History", 2)

      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course_1.enroll(student1)
      course_2.enroll(student2)

      gradebook.add_course(course_1)
      gradebook.add_course(course_2)

      expect(gradebook.list_all_students).to eq [student1, student2] 
    end
  end

  describe '#list_students_below_grade' do
    it 'can return a list of students below a certain grade' do
      gradebook = Gradebook.new("Jamison")

      course_1 = Course.new("Calculus", 2) 
      course_2 = Course.new("History", 2)

      student1 = Student.new({name: "Morgan", age: 21})
      student1.log_score(47)
      student1.log_score(35)
      student2 = Student.new({name: "Jordan", age: 29})
      student2.log_score(97)

      course_1.enroll(student1)
      course_2.enroll(student2)

      gradebook.add_course(course_1)
      gradebook.add_course(course_2)

      expect(gradebook.list_students_below_grade(50)).to eq [student1]
    end
  end
end
