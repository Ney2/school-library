require './teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'Should Create a Teacher' do
      teacher = Teacher.new(30, 'Math', 'Maria')
      expect(teacher.name).to eq('Maria')
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
    end

    it 'Should be instance of Teacher' do
      teacher = Teacher.new(30, 'Maria', 'Math')
      expect(teacher).to be_instance_of(Teacher)
    end

    it 'Should be able to use the services' do
      teacher = Teacher.new(30, 'Maria', 'Math')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
