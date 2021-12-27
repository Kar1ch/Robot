using HorizonSideRobots
include("D://projects/Robot/roblib.jl")

function corners(r)
    coordinates = []
    go_to_corner(r,coordinates)
    corner_point!(r)
    go_back!(r,coordinates)
end

function go_back!(r, coordinates)
    while length(coordinates) > 0
        side = pop!(coordinates)
        move!(r, inverse(side))
    end
end

function corner_point!(r)
    for side in (Nord, Ost, Sud, West)
        moves!(r,side)
        putmarker!(r)
    end
end

function go_to_corner(r,coordinates)
    while !(isborder(r,West)&&isborder(r,Sud))
        if !isborder(r,West)
            move!(r,West)
            push!(coordinates, West)
        end
        if !isborder(r,Sud)
            move!(r,Sud)
            push!(coordinates, Sud)
        end
    end
end