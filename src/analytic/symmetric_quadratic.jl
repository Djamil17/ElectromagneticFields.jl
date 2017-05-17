
using SymPy: Sym

"""
Symmetric quadratic equilibrium in (x,y,z) coordinates.

Parameters: none
"""
struct SymmetricQuadratic{T <: Number} <: AnalyticEquilibrium
    const name::String = "SymmetricQuadraticEquilibrium"
    B₀::T
    SymmetricQuadratic{T}(B₀::T) where T <: Number = new(B₀)
end

SymmetricQuadratic(B₀::T) where T <: Number = SymmetricQuadratic{T}(B₀)


function Base.show(io::IO, equ::SymmetricQuadratic)
    print(io, "Symmetric Quadratic Equilibrium")
end


function analyticA₁(x::Vector, equ::SymmetricQuadratic)
    - equ.B₀ * x[2] * (2 + x[1]^2 + x[2]^2) / 4
end

function analyticA₂(x::Vector, equ::SymmetricQuadratic)
    + equ.B₀ * x[1] * (2 + x[1]^2 + x[2]^2) / 4
end

function analyticA₃(x::Vector, equ::SymmetricQuadratic)
    zero(eltype(x))
end

function analyticMetric(x::Vector, equ::SymmetricQuadratic)
    Sym[1  0  0;
        0  1  0;
        0  0  1]
end

end
