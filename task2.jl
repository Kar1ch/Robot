using HorizonSideRobots
include("E://projects/Robot/roblib.jl");

function perimetr(r::Robot)
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

    for side in (Nord, Ost, Sud, West)
        putmarkers!(r,side)
    end

    moveNum!(r,Ost,i)
    moveNum!(r,Nord,j)
end