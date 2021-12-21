class Student
    def update
        puts "Enter no of sutdent"
        no_of_student=gets.chomp
        puts "number of student: #{no_of_student}" 
    end   
end
record=Student.new
record.update()