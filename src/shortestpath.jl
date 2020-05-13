struct ShortestPath{T}
    dist::Dict{T,Float64}
    prev::Dict{T,T}
end

"""
    get_distance(R, u)

Given ShortestPath R and node u, find distance. If u is not found from R,
return Inf.
"""
function get_distance(R, u)
    return get(R.dist, u, Inf)
end

"""
    get_smallest_distance(R, Q)

Given ShortestPath R and queue Q, find smallest distance.
"""
function get_smallest_distance(R, Q)
    mindist = Inf
    u = -1
    for v in Q
        if get_distance(R, v) < mindist
            mindist = get_distance(R, v)
            u = v
        end
    end
    return u
end

"""
    ShortestPath(G, s)

Find shortest path in graph G, starting from node s.
"""
function ShortestPath(G::Graph{T}, s::T) where T
    R = ShortestPath{T}(Dict(), Dict())
    visited = Set{T}()
    queue = Set{T}()
    dist = R.dist
    prev = R.prev
    dist[s] = 0
    prev[s] = s
    push!(queue, s)
    while (!isempty(queue))
        u = get_smallest_distance(R, queue)
        for v in get_adjacent_nodes(G, u)
            v in visited && continue
            tentative_distance = get_distance(R, u) + get_edge_weight(G, u, v)
            if tentative_distance < get_distance(R, v)
                dist[v] = tentative_distance
                prev[v] = u
                push!(queue, v)
            end
        end
        delete!(queue, u)
        push!(visited, u)
    end
    return ShortestPath(dist, prev)
end
