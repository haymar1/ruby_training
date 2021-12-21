puts "Enter number for multiplication table"
num=gets.chomp.to_i
for i in 1..12
    mul=num*i
    puts "#{num} * #{i} = #{mul}"
end