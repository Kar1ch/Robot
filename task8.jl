using HorizonSideRobots
include("G://projects/Robot/roblib.jl")

function main(r)
    prohod(r)
end

function prohod(r)
    i = 1
    while true
        moveNum!(r, Ost, i)
        if !isborder(r, Nord)
            break
        end    
        moveNum!(r, West, i+1)
        if !isborder(r, Nord)
            break
        end  
        i +=2
    end
    move!(r, Nord)
end
