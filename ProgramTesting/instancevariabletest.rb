class Student
    def initialize(id, name, address)
        @stu_id=id
        @stu_name=name
        @stu_address=address
    end
    def display()
        puts "Studet id: #@stu_id"
        puts "Studet name: #@stu_name"   
        puts "Studet address: #@stu_address"
    end
end
stu1=Student.new(1, "haymar", "tgi")
stu2=Student.new(2, "haymar", "ygn")
stu3=Student.new(3, "haymar", "mandalay")
stu4=Student.new(4, "har", "mgy")

stu1.display()

stu2.display()

stu3.display()

stu4.display()

