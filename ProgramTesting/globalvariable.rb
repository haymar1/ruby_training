$global_variable=10
class Class1
    def print
        puts "Global variable values is: #$global_variable"    
    end  
end
class Class2
    def print
        puts "Global variable values is: #$global_variable"    
    end
end
c1=Class1.new
c1.print
c2=Class2.new
c2.print