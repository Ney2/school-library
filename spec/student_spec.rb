require './student'

describe Student do
  context 'When testing the Student class' do
    it 'Should Create a Student' do
      student = Student.new(12, 'Jhon', 'Classroom 1', true)
      expect(student.name).to eq('Jhon')
      expect(student.age).to eq(12)
      expect(student.classroom).to eq('Classroom 1')
      expect(student.parent_permission).to eq(true)
    end

    it 'Should be instance of Student' do
      student = Student.new('Jhon', 12, 'Classroom 1', true)
      expect(student).to be_instance_of(Student)
    end

    it 'Should play hooky' do
      student = Student.new('Jhon', 12, 'Classroom 1', true)
      expect(student.play_hooky).to eq("¯\(ツ)/¯")
    end
  end
end
