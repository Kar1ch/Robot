using HorizonSideRobots
include("D://projects/Robot/roblib.jl");

function ladder(r)
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

    c=0
    while isborder(r,Ost)==false
        move!(r,Ost)
        putmarker!(r)
        c=c+1
    end
    moveNum!(r,West,c)
    putmarker!(r)
    if(isborder(r,Nord)==false)
        move!(r,Nord)
    end
    while (c>0)
        c=c-1
        putmarkersNum!(r,Ost,c)
        move_by_markers(r,West)
        putmarker!(r)
        if(isborder(r,Nord)==false)
            move!(r,Nord)
        else
            break
        end
    end

    moves!(r,Sud)
    moveNum!(r,Ost,i)
    moveNum!(r,Nord,j)
end