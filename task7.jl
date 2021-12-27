using HorizonSideRobots
include("G://projects/Robot/roblib.jl")

function main(r)
    way= []
    go_to_corner_n_coord(r, way)
    chess!(r, way)
    go_to_corner(r)
    go_back(r, way)
end

function chess!(r, way)
    if length(way) % 2 == 0 || length(way) == 0
        start_with_marker = true
    else
        start_with_marker = false
    end

    side = Ost
    while true
        while true
            if start_with_marker
                putmarker!(r)
            end
            if isborder(r, side)
                break
            end
            move!(r, side)
            start_with_marker = !start_with_marker
        end
        if isborder(r, Nord) == true
            break
        end
        move!(r, Nord)
        start_with_marker = !start_with_marker
        side = inverse(side)
    end
end
