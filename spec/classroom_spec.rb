require './classroom'
require './student'

describe Classroom do
  context 'When testing the Classroom class' do
    it 'Should Create a Classroom' do
      classroom = Classroom.new('Math')
      expect(classroom.label).to eq('Math')
    end

    it 'Should be instance of Classroom' do
      classroom = Classroom.new('Math')
      expect(classroom).to be_instance_of(Classroom)
    end

    it 'Should Create a Student' do
      classroom = Classroom.new('Math')
      student = Student.new(20, 'Mulu', 'Math', true)
      classroom.add_student(student)
      expect(classroom.students.length).to eq(1)
    end
  end
end
