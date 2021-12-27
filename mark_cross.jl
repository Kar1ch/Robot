using HorizonSideRobots
include("E://projects/Robot/roblib.jl");

function mark_cross(r::Robot)
    for side in (Nord, Ost, Sud, West)
        putmarkers!(r,side)
        move_by_markers(r,inverse(side))     
    end
    putmarker!(r);
end