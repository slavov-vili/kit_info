# Minimum Spanning Tree (MST)
1. Definition
    - G = (V, E) = connected, weighted, undirected graph
        * V = vertices, n = |V|
        * E = edges, m = |E|
    - w: E -> R+ = weight function
    - T = (V, E0) = MST (connected subgraph)
        * E0 is subset of E
        * The sum of the weights in E0 is minimized
        * Must be a tree (fewer edges = disconnect, more edges = cycles)
    - If the graph is unconnected - T is a forest = set of MSTs of all connected components
    - There can be multiple MSTs and they are all valid
1. Properties
    - Cycle property = the edge with the strictly highest weight in a cycle is NOT in the MST
    - Cut property = if a cut edge is lighter than all other edges in the current cut - it belongs to the MST
        * Cut = Partitioning of the graph in 2 distinct subsets
        * Cut edge = An edge which connects two edges from the different subsets of a cut
    - Uniqueness = If all edges are unique - then G has a unique MST
    - The MST has n-1 edges
    - If all edges are positive - the MST is a minimum-cost subgraph
    - If the minimum-cost edge is unique - it is included in the MST
    - Contraction
        * T = Tree of some of the MST edges
        * If we contract the graph so that T is a single vertex - MST\_contracted + T = MST of original graph



# Parallel Algorithms
1. Models of Computation in Shared Memory
    - Shared Memory PRAM (Parallel RAM)
    - EREW, CREW, CRCW
        * CRCW-Common = All Ps write same value
        * CRCW-Arbitrary = A random P writes its value
        * CRCW-Priority = P with smallest ID (highest priority) writes
        * CRCW-Reducation = write the result of a reduction (associative operation)
1. Fundamental Operations
    - Parallel Map (map(f, L))
        * Applies a function f to all elements of L
        * If no return value, but void -> called parallel foreach or for-loop
    - Parallel Reduction (Fold)
        * Iteratively applies a function f to two values
        * reduce(f, L[0...n-1]) = reduce(f, L[0...n-2], L[n-1])
        * f = pure associative binary function
    - Parallel Prefix-Sum (Scan)
        * Returns a sequence S where S[i] = sum of L[0...i]
        * Last prefix sum = reduction
        * Can be computed in O(log(n))
        * Useful for defining other primitives
    - Parallel Filtering
        * filter(pred, L)
        * Returns all elements from L for which pred returns true
        * Efficient implementation
            + Parallel map to apply the predicate to each element
            + Do prefix sum on each element (result = # trues before i = index of i in output)
            + Parallel for to copy the elements at their indices
        * Special case: pack(flags, L) = store all L[i] where flags[i] = 1 in a new array
    - Parallel Sorting
        * In real world, people prefer Sample Sort



# Classic Algorithms
1. Boruvka's Algorithm
    - Description
        * Runs in phases
        * Keeps a set of connected components
        * Starts with n components (1 per edge)
        * Boruvka step = reduce the number of components
        * Do until only 1 component is left
    - Boruvka step
        * Idea: exploit the cut property to find MST edges
        * For each connected component - find the minimum edge
        * Add those to the MST (cut property with components = cut)
        * Combine the connected components which are connected through the edges
    - Parallelization
        * Do True graph compaction after grafting (contract every component to a super-vertex)
            + super-vertex = concept which groups connected vertices into 1
        * Blah blah different implementations
        * Problem: Concurrent find-min globally, but sequential locally (imbalance if nodes are of different degrees)
            + TODO: load-balancing boruvka?
        * 
1. Prim's Algorithm
    - Idea: Pick a random node as the MST and start growing the tree
        * Grow by finding the nearest vertex to the tree which hasn't been added yet
    - Parallelization
        * Hard to parallelize
        * Algorithms run multiple instances with different starts and stop to merge when the trees touch
1. Kruskal's Algorithm
    - Like Boruvka, but look at all edges at once (not at each component)
    - Find the min edge between 2 components and combine them
    - Implementation: sort edges in ascending order and check if they are in the same component



# Paper Algorithm
1. Introduction
    - Based on Boruvka's Algorithm
    - Same general idea: outer loop which does Boruvka steps until only 1 component is left
    - Boruvka steps still has 3 phases: find-min, grafting, shortcutting
1. Priority Write (/Update)
    - Definition
        * x.pwrite(v) or pwrite(x, v)
            + Priority write of value v at memory cell x
        * Replaces the value at memory x with v if v is smaller
    - If done in parallel - data race condition
    - => Need to make it atomic
    - Not readily available in modern shared memory => have to build it using atomic compare-and-swap (CAS)
    - Atomic CAS
        * Compares the value at an address with an expected one and writes a new value if they are the same
        * The value differs from the expected if another thread has written to it
        ```
            function cas(p: pointer to int, old: int, new: int)
                if *p == old
                    *p <- new
                    return true
                return false
        ```
    - Atomic pwrite
        * Reads the old value from memory and continuously tries to write a smaller value there
        * Stops iterating if the value is >= OR the smaller value was successfully written
        * Example:
            + x = 5, p1.v = 3, p2.v = 1
            + p1 reads 5 first, 3 < 5 and cas returns true => p1 writes its value
            + p2 reads 5 before p1 writes, 1 < 5, but cas returns false (expected 5, but was 3)
            + p2 reads 3, 1 < 3, cas returns true => p2 writes its value
            + x = 1
        ```
            function pwrite(x: pointer, v: value)
                do
                    old <- *x
                while v < old and cas(x, old, v) = false
        ```
        * Runtime
            + Okay since we only write if smaller and processors write at random times
            + Best case: smallest writes first => only 1 write
            + Worst case: write in decreasing order => p writes
        * Similar to CRCW-Priority write, but depends on parameter, not on P.ID
1. Compaction
    - The step from Boruvka's where the connected components are compacted into super-vertices
    - Definition
        * Takes a tree and turns all paths into root leaves
        * A tree is represented using a parent array which eventually points to the root
            + root: parent[i] = i
            + root leaf: parent[parent[i]] = i
        ```
            function compact(parent[0...n-1])
                foreach 0 <= i < n do in parallel
                    while parent[i] != parent[parent[i]] do
                        parent[i] = parent[parent[i]]   // Grafting
        ```
        * The code is run by all processors simultaneously => all run the while check simultaneously
            + Important for synchronization and the theoretical time bound O(log(n))
1. The algorithm
    - Does not different much from sequential Boruvka
    - Assuming an edge-list representation
        * Parallel loop over the edges to determine the best edge for each component
        * Do pwrite for each endpoint of the edge using the weight and the ID
        * Graft the trees along the best edges (break symmetry as in sequential, but in parallel)
        * Perform full compaction
        * TODO: WTF?
            + Sth about filtering active super-edges
            + improve memory locality by changing the endpoints to representatives
            + filter self-edges
    - Definitions
        * Tuple comparison (lexicographical order)
            + (a1,...,an) < (b1,...,bn) if there exists an index i (1 <= i <= n), where
            + for all indices j (1 <= j < i): aj = bj and ai < bi
        * Edge comparison
            + compare the tuples (weight, index)
        * <-par = parallel assignment (divide assignments evenly among the processors and each writes its part)
        * before each Boruvka step: V always only holds the vertices which are representatives of their components
1. Pseudocode
```
// G = (V, E)
begin
    // Initialization
    for i in V do
        parent[i] <--par i
    MST_edges = {}


    while |V| > 1 and |E| > 0 do
        // Invariants: V only contains root vertices, E does not contain self-loops (edges?)
        for i in V do
            best[i] <--par sentinel // sentinel = edge with infinite weight


        // find-min step
        foreach e in E dopar
            best[e.u].pwrite(e)
            best[e.v].pwrite(e)
        // best[i] is now the lightest edge which leaves the component where i is (or sentinel if there are none)
        // solves the load-imbalance issue where we loop over vertices in parallel, but over edges sequentially


        // grafting step
        foreach i in V dopar
            // mst_edge = local set used to make the MST
            index = index of i in the current set V
            if best[i] == sentinel then
                parent[i] <-- -1             // deactivate the component
                mst_edge[index] <-- sentinel
            else
                j = other endpoint of the edge best[i]
                // if the best edge of both points is the same
                // and the start is smaller
                if best[i] == best[j] and i < j then
                    // do nothing with parent[i]
                    mst_edge[index] <-- sentinel
                else
                    parent[i] <-- j             // j is the parent of i (graft i to j)
                    mst_edge[index] <-- best[i] // point i has an edge which belongs to the MST


        // Add edges to the MST
        MST += {mst_edge[i] | mst_edge[i] != sentinel and 0 <=i < |V| }

        // Shortcutting step
        // pointer-jumping on the parent array for the vertices in V in order to compact the tree
        for i in 0..len(parent) dopar
            while (parent[i] != parent[parent[i]])
                parent[i] = parent[parent[i]]

        // Relabeling step
        // saves us some lookups in the parent array in the next iteration
        E = {(parent[e.u], parent[e.v], e.w) | e in E}


        // Filtering step
        // restores the loop invariant
        E = {e | e in E and e.u != e.v}
        V = {i | i in V and parent[i] == i}
return MST
```
    - IDEA: combine relabeling (and filtering) with sorting and then re-run with better find-min?
        * pragma omp parallel sort
    - find-min in sorted array (first value in array is best)
        * Idea 1: write once per vertex (as first is best?)
            + Use dynamic scheduling so that more processors get the lower values?
        * Idea 2: parallel iteration over vertices with binary search over edges?
            + look for edges where u = cur edge and smaller than what?
            + lower\_bound or sth for bin search
