using Calculus

"""
The Newton-Raphson method can be extended to find the maxima of a twice differentiable
function ``f(x)``. If ``f:[a, b] -> R`` has a continuous derivative ``f^'(x)``,
then fnding the maximum of ``f`` is equivalent to finding the maximum of ``f(a)``
, ``f(b), f(x_1), f(x_2), \ldots, f(x_n)`` where ``x_1, x_2, \ldots, x_n`` are 
the roots of ``f^'(x)``.
"""

function maximize_newton(f::Function, x0::Float64; tol = 1e-9, max_iter = 100)

    x = x0
    iter = 0

    while (abs(derivative(f, x)) > tol) && (iter < max_iter)
        x = x - derivative(f, x)/second_derivative(f, x)
        iter += 1
    end

    if iter == max_iter 
        println("Newtons method failed to converge")
    else
        return x
    end
    
end

# Lets maximize the gamma(2, 3) function

f(x) = 4 * x^2 * exp(-2*x)

maximize_newton(f, 0.25)
maximize_newton(f, 0.5)
maximize_newton(f, 0.75)
maximize_newton(f, 5.0) 
