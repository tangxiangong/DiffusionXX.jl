"""
    RandomWalk1D(step_num, step_size, left)

1维随机游走
"""
struct RandomWalk1D
    step_num::Integer
    start_point::Real
    step_size::Real
    left::Real
    function RandomWalk1D(step_num::Integer, start_point::Real, step_size::Real, left::Real)
        step_num > 0 || throw(DomainError("需为正整数"))
        step_size > zero(typeof(size)) || throw(DomainError("需为正数"))
        0 <= left <= 1 || throw(DomainError("概率需在0与1之间"))
        return new(step_num, start_point, step_size, left)
    end
end

RandomWalk1D(step_num::Integer; start_point::Real=0, step_size::Real=1, left::Real=0.5) = RandomWalk1D(step_num, start_point, step_size, left)

function simulate(model::RandomWalk1D)
    # noise = [rand() < model.left ? -1 : 1 for _ in 1:model.step_num]
    # x = cumsum([model.start_point; model.step_size*noise])
    # return x
    x = Vector{promote_type(typeof(model.step_size), typeof(model.start_point))}(undef, model.step_num+1)
    x[1] = model.start_point
    for k in 2:model.step_num+1
        if rand() < model.left
            direction = -1
        else
            direction = 1
        end
        @inbounds x[k] = x[k-1] + direction * model.step_size
    end
    return x
end
