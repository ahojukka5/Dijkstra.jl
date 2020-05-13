struct Graph{T}
    adjacency_lists :: Dict{T, Set{T}}
    edge_weights :: Dict{Tuple{T, T}, Float64}
end

function Graph()
    return Graph{Int}(Dict(), Dict())
end
