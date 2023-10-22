include("_randomwalk1d.jl")
include("_randomwalk2d.jl")

struct RandomWalk
    dims::Integer
    step_num::Integer
    start_point::Union{Real, Tuple{Real, Real}}
    step_size::Real
    prob::Union{Real, Tuple{Real, Real, Real, Real}}
end
