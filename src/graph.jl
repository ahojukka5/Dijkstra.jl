struct Graph{T}
    adjacency_lists :: Dict{T, Set{T}}
    edge_weights :: Dict{Tuple{T, T}, Float64}
end
