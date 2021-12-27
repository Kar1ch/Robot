using HorizonSideRobots

"""
    moves!(r::Robot, side::HorizonSide)

-- Перемещает робота до упора в заданном направлении
"""
function moves!(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
    end
end

"""
    check_moves!(r::Robot, side::HorizonSide)

--Остановка если в указанной стороне есть стена
"""


"""
    moveCount!(r::Robot, side::HorizonSide) 

-- Считает шаги до стены в указаном направлении
"""
function moveCount!(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r,side)
        i=i+1
    end
end

"""
    moves!(r::Robot, side::HorizonSide, num_steps::Int)

-- Перемещает робота в направлении side на заданное число шагов
"""
function moveNum!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
    end
end


function putmarkersNum!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r, side)
        putmarker!(r)
    end
end

"""
    putmarkers!(r::Robot, side::HorizonSide)

-- Ставит маркеры всюду в заданном направлении, пока робот не встретит перегородку,
   исключая начальную позицию
"""
putmarkers!(r::Robot, side::HorizonSide) =
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end


function move_by_markers(r::Robot, side::HorizonSide)
    while ismarker(r) == true
        move!(r, side)
    end
end

"""
--Ставит робота в верхний левый или правый угол
"""
function cornerRoof(r::Robot, side::HorizonSide)
    while isborder(r,Nord)==false
        move!(r,Nord)
    end
    while isborder(r,side)==false
        move!(r,side)
    end
end


"""
--Ставит робота в нижний левый или правый угол
"""
function cornerFloor(r::Robot,side::HorizonSide)
    while isborder(r,Sud)==false
        move!(r,Sud)
    end
    while isborder(r,side)==false
        move!(r,side)
    end
end



"""
    inverse(side::HorizonSide)

-- Возвращает направление, противоположное заданному
"""
inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))



"""
    turn_right(side::HorizonSide)

--Поворачивает направление по часовой стрелке на один
"""
turn_right(side::HorizonSide) = HorizonSide(mod(Int(side) - 1, 4))



"""
    turn_left(side::HorizonSide)

--Поворачивает направление против часовой стрелке на один
"""
turn_left(side::HorizonSide) = HorizonSide(mod(Int(side) + 1, 4))



"""
    go_to_corner(r::Robot)

--Ставит робота в левый нижний угол
"""
function go_to_corner(r)
    while !(isborder(r,West)&&isborder(r,Sud))
        if !isborder(r,West)
            move!(r,West)
        end
        if !isborder(r,Sud)
            move!(r,Sud)
        end
    end
end



"""
    go_to_corner_n_coord(r::Robot, coordinates::Vector)

--Ставит робота в левый нижний угол и запоминает начальные координаты
"""
function go_to_corner_n_coord(r::Robot, way::Vector)
    while !(isborder(r, West)&&isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            push!(way, West)
        end
        if !isborder(r,Sud)
            move!(r, Sud)
            push!(way, Sud)
        end
    end
end



"""
    go_back(r::Robot, way::Vector)

--Возвращает робота из угла на его начальную позицию
"""
function go_back(r, way)
    while length(way) > 0
        side = pop!(way)
        move!(r, inverse(side))
    end
end
