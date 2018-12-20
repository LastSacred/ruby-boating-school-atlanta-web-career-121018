class Student

  attr_reader :first_name

  @@all = []

  def self.all
    @@all
  end

  def self.find_student(name)
    self.all.find do |student|
      student.first_name == name
    end
  end

  def initialize(first_name)
    @first_name = first_name
    self.class.all << self
  end

  def add_boating_test(name, status, instructor)
    BoatingTest.new(self, name, status, instructor)
  end

  def tests
    BoatingTest.all.select do |test|
      test.student == self
    end
  end

  def tests_converted_status
    tests.map do |test|
      if test.status == "passed"
        1.0
      else
        0.0
      end
    end
  end

  def grade_percentage
    (tests_converted_status.inject { |sum, status| sum + status } / tests_converted_status.size).round(2)
  end

end
