require './lib/university_data'
require './lib/gradebook'
require './lib/course'
require './lib/student'

RSpec.describe UniversityData do
  describe '#initialize' do
    it 'exists' do
      university = UniversityData.new
      expect(university).to be_a UniversityData
    end

    it 'has an empty gradebooks array by default' do
      university = UniversityData.new
      expect(university.gradebooks).to eq []
    end
  end

  describe '#add_gradebook' do
    it 'can add a gradebook to the gradebooks array' do
      university = UniversityData.new

      gradebook = Gradebook.new("Mike")
      gradebook_2 = Gradebook.new("Jamison")

      university.add_gradebook(gradebook)
      university.add_gradebook(gradebook_2)

      expect(university.gradebooks).to eq [gradebook, gradebook_2]

    end
  end

  describe '#list_all_students' do
    it 'can list all students in all courses' do

      university = UniversityData.new

      gradebook = Gradebook.new("Brian")
      gradebook_2 = Gradebook.new("Jamison")

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
      gradebook_2.add_course(course_2)

      university.add_gradebook(gradebook)
      university.add_gradebook(gradebook_2)

      expect(university.list_all_students).to eq [student1, student2]
    end
  end

  describe '#list_all_students_below_grade' do
    it 'can  list all students below a grade' do

      university = UniversityData.new

      gradebook = Gradebook.new("Jamison")
      gradebook_2 = Gradebook.new("Mike")

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
      gradebook_2.add_course(course_2)

      university.add_gradebook(gradebook)
      university.add_gradebook(gradebook_2)

      expect(university.list_all_students_below_grade(50)).to eq [student1]

    end
  end

  describe '#list_students_with_grade_range' do
    it 'can return of list of students whose grade falls between two values' do
      university = UniversityData.new

      gradebook = Gradebook.new("Jamison")
      gradebook_2 = Gradebook.new("Mike")

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
      gradebook_2.add_course(course_2)

      university.add_gradebook(gradebook)
      university.add_gradebook(gradebook_2)

      expect(university.list_all_students_with_grade_range(50, 100)).to eq [student2]
    end
  end
end



