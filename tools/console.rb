require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

arthur = Student.new("Arthur")
ryan = Student.new("Ryan")

brit = Instructor.new("Brit")
rob = Instructor.new("Rob")

swim = arthur.add_boating_test("swim for your life", "pending", brit)
sails = arthur.add_boating_test("set sail!", "passed", rob)
dive = ryan.add_boating_test("dive! dive! dive!", "pending", rob)

test = rob.fail_student("Ryan", "just dive once")


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
