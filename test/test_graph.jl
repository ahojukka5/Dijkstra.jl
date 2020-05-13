using Dijkstra
using Test

# Create new graph. By default, labels are of type Integer
G = Graph()

# Edges are added to graph using function `add_edge!`. First two parameters
# after G are node labels and third one is the edge weight.
add_edge!(G, 1, 2, 3)
add_edge!(G, 1, 3, 2)
