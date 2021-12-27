using HorizonSideRobots
include("G://projects/Robot/roblib.jl")

function main(r)
    temp_count(r)
end

function temp_count(r)
    temp = 0
    count = 0

    side = Nord
    while true
        while true
            move!(r, side)
            if ismarker(r)
                temp += temperature(r)
                count += 1
            end

            if isborder(r, side)
                break
            end
        end

        if isborder(r, side) && isborder(r, Ost)
            break
        end

        move!(r, Ost)
        side = inverse(side)
    end

    print(temp / count)
end
