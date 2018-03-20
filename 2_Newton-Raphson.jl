"""
Given a differentiable function `f(x)` with a continuous derivative, our aim is
to find its root, `a`. To do this, we solve the following inductive problem:

1. Start with an initial guess ``x_0``
2. ``x_{n+1} = x_n - f(x_n)/f^'(x_n)``

Obviously, the two inputs needed are the function its derivative at each point
in the exploration. 
"""

using Calculus

function root_newton_raphson(f::Function, x0::Float64; tol = 1e-9, max_iter = 100)

    x = x0
    iter = 0

    while (abs(f(x)) > tol) && (iter < max_iter)
        x = x - f(x)/derivative(f, x)
        iter += 1
        println("At iteration ", iter, "value of x is: ", x, "\n")
    end
    
    if abs(f(x)) > tol 
        println("Algorithm failed to converge \n")
    else
        println("Algorithm converged")
    end

    return x
end

# let us compute the roots of the following function

f(x) = log(x) - exp(-x)
root_newton_raphson(f, 2.0, tol = 1e-6)

# Both the ability to take a derivative and the initial guess matter!