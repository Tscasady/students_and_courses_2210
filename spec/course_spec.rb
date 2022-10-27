require './lib/course'

RSpec.describe Course do
  describe '#initialize' do
    it 'exists' do
      course = Course.new("Calculus", 2) 

      expect(course).to be_a Course
    end

    it 'has a name' do
      course = Course.new("Calculus", 2) 

      expect(course.name).to eq "Calculus"
    end

    it 'has a capacity' do
      course = Course.new("Calculus", 2) 

      expect(course.capacity).to eq 2
    end

    it 'has an empty students array by default' do
      course = Course.new("Calculus", 2) 

      expect(course.students).to eq []
    end
  end

  describe '#full?' do
    it 'returns a boolean representing whether or not the class is full' do
      course_1 = Course.new("Calculus", 2) 
      course_2 = Course.new("Calculus 2", 2) 

      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course_1.enroll(student1)
      course_2.enroll(student2)

      expect(course_1.full?).to eq false
      expect(course_2.full?).to eq true
    end
  end

  describe '#enroll' do
    it 'can add a student to Course students array.' do
      course = Course.new("Calculus", 2) 

      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})

      course.enroll(student1)
      course.enroll(student2)

      expect(course.students).to eq [student1, student2]
    end
  end
end

