using Test

@testset "Test Dijkstra.jl" begin
    @testset "test_graph" begin
        include("test_graph.jl")
    end
end
