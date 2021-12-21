
def YieldTesting
    puts "output1"
    yield "tutorial"
    puts "output2"
    yield "tutorial2"  
end
YieldTesting{ |example| puts "Inside Block #{example}"} 