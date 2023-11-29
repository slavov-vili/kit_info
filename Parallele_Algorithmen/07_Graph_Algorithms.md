# Parallel Graph Algorithms
1. Points of interest
    - Main interest: sparse, polylog execution time, efficient
    - Negative Examples
        * DFS, BFS
        * Shortest paths
        * Topological sorting
    - Positive Examples
        * Connected components
        * Minimal spanning trees
        * Graph partitioning



# Minimal Spanning Trees
1. Problem Definition
    - TODO: Graphs, Nodes, etc.
1. Selecting and Discarding Edges
    - 
1. Jarnik-Prim Algorithm
    - Famous inherently sequential, similar to Dijkstra
    - u in S, v outside
    - Graph Representation of Jarnik-Prim
        * Adjacency array representation
        * Node array = index of node of sth?
        * Edge array = end of edge
    - Analysis
        * 
1. Kruskal's Algorithm
    - Uses subforests instead
    - Analysis
1. Edge Contraction
    - 
1. Boruvka's Algorithm
    - 
    - Finding lighest incident edges
        * Prefix sum = figure out which processors take each nodes?
    - Structure of Resulting Components
        * lightest edge creates a cycle
    - Pseudotrees -> Rooted Trees
        * root = node with smallest id?
        * root points to itself
        * sth about tie-breaking to break up symmetrical cases
    - Rooted Trees -> Rooted Stars
        * Everyone should point to their root
    - Contraction
    - Recursion
