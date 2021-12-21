puts "Enter number for factorial"
input_num=gets.chomp.to_i
i=1
factorial=1
while i<=input_num
    factorial *=i
    i+=1
end
puts "Your input number of factorial is: #{factorial}"