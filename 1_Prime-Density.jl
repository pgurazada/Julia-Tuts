using Distributions

"""
    isprime(n) -> returns a boolean indicating if the input is prime

We define the base cases 1 and 2 to be true. For the rest we search if there is
a divisor between 2 and sqrt(n). We return a false in case we find a divisor

"""

function isprime(n::Int; is_prime = true)
    n == 1 && return true
    n == 2 && return true
    if n > 2
        m = 2
        m_max = sqrt(n)
        while is_prime && m <= m_max
            if n % m == 0
                is_prime = false
            end
            m += 1
        end
    end
    return is_prime
end

# let us now count number of primes from 1:1000

ns = 2:1000
sum(map(isprime, ns))

"""
For a number `n`, let `rho(n)` be the number of primes less than or equal to `n`

We wish to check if ``\lim_{n\rightarrow\inf}\dfrac{\rho(n)log(n)}{n} \rightarrow 1``

"""

rho(n) = sum(map(isprime, 1:n))

# We are now ready to check the convergence to 1 for high values of n
# Warning: Dont try this in R

rho(10^2) * log(10^2)/10^2 
rho(10^3) * log(10^3)/10^3
rho(10^4) * log(10^4)/10^4
rho(10^5) * log(10^5)/10^5
rho(10^6) * log(10^6)/10^6
@time rho(10^7) * log(10^7)/10^7
