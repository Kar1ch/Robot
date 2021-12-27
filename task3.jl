using HorizonSideRobots
include("E://projects/Robot/roblib.jl");

function mark_all(r::Robot)
    i=0;
    j=0;
    while isborder(r,Sud)==false
        move!(r,Sud)
        j = j+1
    end
    while isborder(r,West)==false
        move!(r,West)
        i = i+1
    end

    while isborder(r,Ost)==false
        putmarkers!(r,Ost)
        move_by_markers(r,West)
        putmarker!(r)
        if isborder(r,Nord)==false
            move!(r,Nord)
        else break
        end
    end
    moves!(r,Sud)

    moveNum!(r,Ost,i)
    moveNum!(r,Nord,j)
end