
import Pkg; Pkg.add("Plots")
using Plots
gr() #ensure the GR back-end is used

#the anonymous function mypi2 approximates the value of pi based on an argument n, where 1/1 + 1/4 + 1/9 + ... + 1/n^2 = pi^2/6
mypi2 = n -> sqrt(sum(map(x -> 1/x^2, 1:n)) * 6)

#initializes a plot with desired attributes
plt = plot([mypi2], zeros(0), leg=false, linecolor=:black, xlabel="N Value", ylabel="Pi Value", title="Approximation of Pi vs. N Value")

#creates gif animation representing the approximated value of pi as n increases
anim = Animation()
@gif for i = range(0, stop=100, length=100)
    push!(plt, i, Float64[mypi2(i)])
    frame(anim)
end

#saves the animation as "piapprox.gif"
gif(anim, "piapprox.gif", fps=15)


