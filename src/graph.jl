struct Graph{T}
    adjacency_lists :: Dict{T, Set{T}}
    edge_weights :: Dict{Tuple{T, T}, Float64}
end

function Graph{T}() where T
    return Graph{T}(Dict(), Dict())
end

function Graph()
    return Graph{Int}()
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

"""
    get_edge_weight(G, u, v)

Return edge (u, v) weight from graph G.
"""
function get_edge_weight(G, u, v)
    return G.edge_weights[(u, v)]
end

"""
    get_adjacent_nodes(G, u)

Return a set of adjacent nodes to u in graph G.
"""
function get_adjacent_nodes(G::Graph{T}, u) where T
    return get(G.adjacency_lists, u, Set{T}())
end

"""
    generate_random_graph(nvertices, edge_density, min_weight, max_weight)

Generate random graph for test purposes.
"""
function generate_random_graph(nvertices, edge_density, min_weight, max_weight)
    G = Graph()
    for u in 1:nvertices
        nadj = round(Int, nvertices * edge_density)
        while length(get_adjacent_nodes(G, u)) < nadj
            v = rand(1:nvertices)
            u == v && continue
            w = rand(min_weight:max_weight)
            add_edge!(G, u, v, w)
        end
    end
    return G
end
