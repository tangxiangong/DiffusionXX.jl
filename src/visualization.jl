using Plots()
pgfplotsx()

function plot(model::RandomWalk1D)
    x = simulate(model::RandomWalk1D)
    plot(x, markershape=:circle, seriestype=:steppre, framestyle=:origin, draw_arrow=true)
end