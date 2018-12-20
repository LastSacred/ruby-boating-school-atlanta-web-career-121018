class Instructor

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def find_test(student_name, test_name)
    BoatingTest.all.find do |test|
      test.name == test_name && test.student.first_name == student_name
    end
  end

  def pass_student(student_name, test_name)
    if boatingtest = find_test(student_name, test_name)
      boatingtest.status = "passed"
    else
      boatingtest = BoatingTest.new(Student.find_student(student_name), test_name, "passed", self)
    end
      boatingtest
  end

  def fail_student(student_name, test_name)
    if boatingtest = find_test(student_name, test_name)
      boatingtest.status = "failed"
    else
      boatingtest = BoatingTest.new(Student.find_student(student_name), test_name, "failed", self)
    end
      boatingtest
  end

end
