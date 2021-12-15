black = "0"
white = "1"
8.times do |i|
    8.times do |i|
        if i.even?
            print white + " "
        else
            print black + " "
        end
    end
    puts
    temp = black
    black = white
    white = temp
end
            