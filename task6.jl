using HorizonSideRobots
include("G://projects/Robot/roblib.jl")

function main(r)
    coordinates = []
    go_to_corner_n_coord(r, coordinates)
    find_rec(r)
    paint_perimetr!(r)
    go_to_corner(r)
    go_back!(r, coordinates)
end

function find_rec(r)
    local side = Ost
    while !isborder(r, Nord)
        while !isborder(r, side)
            move!(r, side)
            if isborder(r, Nord) break end        
        end
        if isborder(r, Nord) break end
        side = inverse(side)
        move!(r, Nord)
    end
end

function paint_perimetr!(r)
    direction = West
    while !ismarker(r)
        while isborder(r, turn_right(direction))
            putmarker!(r)
            move!(r, direction)
            if ismarker(r) break end 
        end
        if ismarker(r) break end 
        direction = turn_right(direction)
        putmarker!(r)
        move!(r, direction)
    end
end
