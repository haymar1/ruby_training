row=5;
colunm=row * 2 -1
for i in 0..row
	for j in 0..colunm + 1
		if j >= row - i && j <= row + i
			print "*"
		else
			print " "
		end
	end
	puts
end
for i in (row - 1).downto(0)
	for j in (colunm + 1).downto(0)
		if j >= row - i && j <= row + i
			print "*"
		else
			print " "
		end 
	end
		puts "/n"
	end
