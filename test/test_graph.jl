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
