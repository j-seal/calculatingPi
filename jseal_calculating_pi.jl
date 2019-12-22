#GCI 2019/20 - Julia - Calculating Pi
#Jseal


#Iterative programming version of mypi()
#mypi(n) takes a single argument, n, such that 1/1 + 1/4 + 1/9 + ... + 1/n^2 = π^2/6, and approximates π using the solution to the Basel problem
function mypi(n)
    if n >= 0 && isa(n, Integer) #data sanitation, ensures that n is a whole number
        sum = 0
        for i in 1:n #for-loop to add together all terms of the "infinite" series, 1/1 + 1/4 + 1/9 + ... + 1/n^2
            sum += 1/(i ^ 2)
        end
        pi = sqrt(6 * sum)
        return pi
    else
        return "Invalid value of n."
    end
end
mypi(1000)

#Functional programming version of mypi()
#mypi2(n) takes a single argument, n, such that 1/1 + 1/4 + 1/9 + ... + 1/n^2 = π^2/6, and approximates π using the solution to the Basel problem
mypi2 = n -> sqrt(sum(map(x -> 1/x^2, 1:n)) * 6)
mypi2(1000)
