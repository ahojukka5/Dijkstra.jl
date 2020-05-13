using Dijkstra
using Test

graph = Graph{Symbol}()
add_edge!(graph, :S, :A, 4)
add_edge!(graph, :S, :B, 3)
add_edge!(graph, :S, :D, 7)
add_edge!(graph, :A, :C, 1)
add_edge!(graph, :B, :S, 3)
add_edge!(graph, :B, :D, 4)
add_edge!(graph, :C, :E, 1)
add_edge!(graph, :C, :D, 3)
add_edge!(graph, :D, :E, 1)
add_edge!(graph, :D, :T, 3)
add_edge!(graph, :D, :F, 5)
add_edge!(graph, :E, :G, 2)
add_edge!(graph, :G, :E, 2)
add_edge!(graph, :G, :T, 3)
add_edge!(graph, :T, :F, 5)

solution = ShortestPath(graph, :S)
@test get_distance(solution, :T) == 10
