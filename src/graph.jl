struct Graph{T}
    adjacency_lists :: Dict{T, Set{T}}
    edge_weights :: Dict{Tuple{T, T}, Float64}
end

function Graph()
    return Graph{Int}(Dict(), Dict())
end

"""
    add_edge!(G, u, v, w)

Add edge (u, v) with weight w to graph G.
"""
function add_edge!(G, u, v, w)
    G.edge_weights[(u, v)] = w
    if !(haskey(G.adjacency_lists, u))
        G.adjacency_lists[u] = Set()
    end
    push!(G.adjacency_lists[u], v)
end
