using Dijkstra
using Test

# Create new graph. By default, labels are of type Integer
G = Graph()

# Edges are added to graph using function `add_edge!`. First two parameters
# after G are node labels and third one is the edge weight.
add_edge!(G, 1, 2, 3)
add_edge!(G, 1, 3, 2)

# To get edge weights back, there's a function `get_edge_weight`:
@test get_edge_weight(G, 1, 2) == 3
@test get_edge_weight(G, 1, 3) == 2

# Graph also stores adjacency lists, and adjacent nodes can be returned using
# `get_adjacent_nodes`:
@test get_adjacent_nodes(G, 1) == Set([2, 3])

# Random graphs can be generated using `generate_random_graph`. For example,
# to generate graph with 10 nodes, edge density 0.5 and smallest weight 1 and
# largest weight 10:

using Random
Random.seed!(1)
G = generate_random_graph(10, 0.5, 1, 10)
adj1 = get_adjacent_nodes(G, 0)
adj2 = Set([1, 2, 6, 7, 9])
@test setdiff(adj1, adj2) == Set([])
