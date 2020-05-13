module Dijkstra

include("graph.jl")
export Graph
export add_edge!
export get_edge_weight
export get_adjacent_nodes
export generate_random_graph

include("shortestpath.jl")
export ShortestPath
export get_distance
export get_path

end # module
