class Tutorial3Controller < ApplicationController  
    
    def calculate_age 
    #now=((Date.today).strftime('%Y/%m/%d')).to_i
    now=Date.today
    dob=Date.parse((params[:date])[:dob])
    day=(now-dob).to_i
    if(day>=365)
        @year=day/365
        puts "#{@year} year old"
    else
    render 'display_age'
    end  
    end 
end 
      