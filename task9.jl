using HorizonSideRobots
include("G://projects/Robot/roblib.jl")

function main(r)
    find_mark(r)
end

function find_mark(r)
    steps = 1
    count = 0
    side = Nord

    while true
        for _ in 1:steps 
            move!(r, side)
            if ismarker(r)
                break
            end
        end
        count +=1
        side = turn_right(side)

        if count % 2 == 0
            steps += 1
        end

        if ismarker(r)
            break
        end
    end
end
